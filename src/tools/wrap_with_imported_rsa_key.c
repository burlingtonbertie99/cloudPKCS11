#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
//#include <getopt.h>

#include <dlfcn.h>

#include <openssl/conf.h>
#include <openssl/evp.h>
#include <openssl/err.h>
#include <openssl/bio.h>
#include <openssl/rsa.h>
#include <openssl/pem.h>
#include <openssl/bn.h>


#include "cryptoki.h"
#include "common.h"


static CK_BBOOL True = CK_TRUE;
static CK_BBOOL False = CK_FALSE;

static CK_FUNCTION_LIST_PTR p11Func;

static char *p11Pin;
static int p11SlotId = -1;
static int keyToWrap = -1;
static char *p11SoName = "/opt/cloudhsm/lib/libcloudhsm_pkcs11.so";
static char *pubKeyName = "trusted.pem";
static char *wrappedKeyName = "wrapped.key";


void initialize_openssl()
{
    ERR_load_crypto_strings();;
    OPENSSL_config(NULL);
}

void cleanup_openssl()
{
    CRYPTO_cleanup_all_ex_data();
    ERR_free_strings();
}

RSA *read_RSA_PUBKEY(char *pubkeyname)
{
    /* Read RSA Pub Key */
    RSA *rsa = RSA_new();
    if (rsa == NULL) {
        fprintf(stderr, "Failed to allocate RSA struct.\n%s\n", ERR_error_string(ERR_get_error(), NULL));
        return NULL;
    }

    BIO *pubin = BIO_new_file(pubkeyname, "r");
    if (pubin == NULL) {
        fprintf(stderr, "Failed to open RSA Pub Key, %s\n%s\n", pubkeyname, ERR_error_string(ERR_get_error(), NULL));
        return NULL;
    }

    if (!PEM_read_bio_RSA_PUBKEY(pubin, &rsa, NULL, NULL)) {
        fprintf(stderr, "Failed to read RSA pub key.\n%s\n", ERR_error_string(ERR_get_error(), NULL));
        return NULL;
    }

    BIO_free(pubin);

    return rsa;
}

int load_pkcs11(char *soname)
{
    void *p11lib = dlopen(soname, RTLD_NOW | RTLD_GLOBAL);
    if (p11lib == NULL) {
        fprintf(stderr, "Failed to open PKCS11 shared object, %s: %s\n", soname, dlerror());
        return EXIT_FAILURE;
    }
    CK_RV (*getFuncList)(CK_FUNCTION_LIST_PTR_PTR);
    getFuncList = dlsym(p11lib, "C_GetFunctionList");
    if (getFuncList == NULL) {
        fprintf(stderr, "Failed to find C_GetFunctionList: %s\n", dlerror());
        return EXIT_FAILURE;
    }
    CK_RV rv = getFuncList(&p11Func);
    if (rv != CKR_OK) {
        fprintf(stderr, "C_GetFunctionList failed: %1$ld (0x%1$02lx)\n", rv);
        return EXIT_FAILURE;
    }

    return 0;
}

void usage(char *progname)
{
    fprintf(stderr, "Usage: %s -s <pkcs11 slot id> -k <key handle to wrap> [-l <pkcs11 library path>] [-p <pkcs11 pin>] [-i <rsa pub key name>] [-o <wrapped key name>]\n", progname);
}


CK_RV get_slot(CK_SLOT_ID *slot_id) {
  if (!slot_id) {
    return CKR_ARGUMENTS_BAD;
  }

  CK_ULONG slot_count = 1;
  CK_RV rv = funcs->C_GetSlotList(CK_TRUE, slot_id, &slot_count);
  if (rv != CKR_OK) {
    printf("C_GetSlotList failed with %lu", rv);
    return rv;
  } else {
    printf("Got the first slot which corresponds to your CloudHSM cluster, "
           "slot id = %lu\n",
           *slot_id);
  }

  return rv;
}

/**
 * Find a slot with an available token.
 * At this time CloudHSM only provides a token on Slot 0. So slot_id
 * only needs space for a single slot and we only call C_GetSlotList once.
 * @param id
 * @param slot_id
 * @return
 */
CK_RV my_pkcs11_get_slot(CK_SLOT_ID *slot_id) {
    CK_RV rv;
    CK_ULONG slot_count;

    if (!slot_id) {
        return CKR_ARGUMENTS_BAD;
    }

    slot_count = 1;
    rv = funcs->C_GetSlotList(CK_TRUE, slot_id, &slot_count);
    if (rv != CKR_OK) {
        printf("C_GetSlotList failed with %lu", rv);
        return rv;
    }

    return rv;
}


int main(int argc, char *argv[])
{


    printf("Starting!\n");
    int opt;
    while( (opt = getopt(argc, argv, "l:p:s:k:i:o:h")) != -1 ) {
        switch (opt) {
            case 'l':
                p11SoName = optarg;
                break;
            case 'p':
                p11Pin = optarg;
                break;
            case 's':
                p11SlotId = atoi(optarg);
                break;
            case 'k':
                keyToWrap = atoi(optarg);
                break;
            case 'i':
                pubKeyName = optarg;
                break;
            case 'o':
                wrappedKeyName = optarg;
                break;
	    case 'h':
            default:
                usage(argv[0]);
                return -1;
        }
    }

    if (p11SlotId < 0 || keyToWrap < 0) {
        usage(argv[0]);
        return -1;
    }

    if (p11Pin == NULL) {
        fprintf(stderr, "Warning: No PKCS11 PIN specified, not calling C_Login\n");
    }

	printf("setting up openssl\n");

    /* Initialize OpenSSL LibCrypto */
    initialize_openssl();

    RSA *rsa = read_RSA_PUBKEY(pubKeyName);
    if (rsa == NULL) {
        return -1;
    }


    printf("BIGNUM TIME\n");

    const BIGNUM *bn_e;
    const BIGNUM *bn_n;


    RSA_get0_key(rsa, &bn_n , &bn_e, NULL);




    /* Get binary exponent and modulus for pub key */
    CK_ULONG keyExponentLen = BN_num_bytes(bn_e);
    CK_BYTE *keyExponent = malloc(keyExponentLen);
    if (keyExponent == NULL) {
        fprintf(stderr, "Failed to allocate memory for exponent: %s\n", strerror(errno));
        return -1;
    }




    BN_bn2bin(bn_e, keyExponent);

    CK_ULONG keyModulusLen = BN_num_bytes(bn_n);
    CK_BYTE *keyModulus = malloc(keyModulusLen);
    if (keyModulus == NULL) {
        fprintf(stderr, "Failed to allocate memory for modulus: %s\n", strerror(errno));
        return -1;
    }
    BN_bn2bin(bn_n, keyModulus);

    /* Free RSA struct */
    RSA_free(rsa);


    CK_RV rv;
    if (load_pkcs11(p11SoName) != 0) {
        return -1;
    }


     printf("____________________________________________________________________________\n");

    /* Initialize P11, create a session and login, if a PIN was supplied */
    rv = p11Func->C_Initialize(NULL);
    if (rv != CKR_OK) {
        fprintf(stderr, "Failed to call C_Initialize: %1$ld (0x%1$08lx)\n", rv);
        return -1;
    }

    
    printf("Opening Session **********************************************************************************\n");

    // CK_SLOT_ID slot_id;
    // rv = pkcs11_get_slot(&slot_id);
    
   // if (rv != CKR_OK) {
     //   fprintf(stderr, "Failed to call getslot\n", rv);
       // return -1;
   // }
    CK_SESSION_HANDLE session;
    rv = p11Func->C_OpenSession(p11SlotId, CKF_SERIAL_SESSION, NULL, NULL, &session);
    if (rv != CKR_OK) {
        fprintf(stderr, "Failed to call C_OpenSession: %1$ld (0x%1$02lx)\n", rv);
        return -1;
    }


	printf("**************************************************************************************************\n");

    if (p11Pin != NULL) {
        rv = p11Func->C_Login(session, CKU_USER, (CK_UTF8CHAR *)p11Pin, strlen(p11Pin));
        if (rv != CKR_OK) {
            fprintf(stderr, "Failed to call C_Login: %1$ld (0x%1$02lx)\n", rv);
            return -1;
        }
    }

    /* Import RSA Pub Key */
    CK_OBJECT_CLASS keyClass = CKO_PUBLIC_KEY;
    CK_KEY_TYPE keyType = CKK_RSA;
    char *keyLabel = "Imported RSA Pub Key";
    CK_OBJECT_HANDLE wrappingKey;
    CK_ATTRIBUTE template[] = {
        { CKA_CLASS, &keyClass, sizeof(keyClass) },
        { CKA_KEY_TYPE, &keyType, sizeof(keyType) },
        { CKA_TOKEN, &False, sizeof(False) },
        { CKA_LABEL, keyLabel, strlen(keyLabel) },
        { CKA_WRAP, &True, sizeof(True) },
        { CKA_PUBLIC_EXPONENT, keyExponent, keyExponentLen },
        { CKA_MODULUS, keyModulus, keyModulusLen }
    };
    size_t template_len = sizeof(template) / sizeof(CK_ATTRIBUTE);
    rv = p11Func->C_CreateObject(session, template, template_len, &wrappingKey);
    if (rv != CKR_OK) {
        fprintf(stderr, "Failed to call C_CreateObject: %1$ld (0x%1$02lx)\n", rv);
        return -1;
    }
    printf("wrappingKey Id: %ld\n", wrappingKey);

    /* Free key exponent and modulus now that they're imported */
    free(keyExponent);
    free(keyModulus);

    
    /* Wrap designated key using the pub key we imported */
    CK_RSA_PKCS_OAEP_PARAMS oaep_params = { CKM_SHA_1, CKG_MGF1_SHA1, CKZ_DATA_SPECIFIED, NULL, 0 };
    CK_MECHANISM mechanism = { CKM_RSA_PKCS_OAEP, &oaep_params, sizeof(oaep_params) };
    CK_BYTE *wrappedKey = NULL;
    CK_ULONG wrappedKeyLen;
    /* This WrapKey call gets how big wrappedKey buffer needs to be */
    rv = p11Func->C_WrapKey(session, &mechanism, wrappingKey, keyToWrap, wrappedKey, &wrappedKeyLen);
    if (rv != CKR_OK) {
        fprintf(stderr, "Failed to call first C_WrapKey: %1$ld (0x%1$02lx)\n", rv);
        return -1;
    }
    wrappedKey = malloc(wrappedKeyLen);
    if (wrappedKey == NULL) {
        fprintf(stderr, "Failed to allocate memory for wrapped key: %s\n", strerror(errno));
        return -1;
    }
    /* This actually wraps out the key */
    rv = p11Func->C_WrapKey(session, &mechanism, wrappingKey, keyToWrap, wrappedKey, &wrappedKeyLen);
    if (rv != CKR_OK) {
        fprintf(stderr, "Failed to call second C_WrapKey: %1$ld (0x%1$02lx)\n", rv);
        return -1;
    }

    /* Write wrapped key to a file */
    int fd = open(wrappedKeyName, O_WRONLY | O_CREAT | O_TRUNC, 0666);
    if (fd < 0) {
        fprintf(stderr, "Failed to open output file for wrapped key: %s\n", strerror(errno));
        return -1;
    }
    write(fd, wrappedKey, wrappedKeyLen);
    close(fd);

    free(wrappedKey);

    /* Cleanup PKCS11 layer */
    rv = p11Func->C_CloseSession(session);
    if (rv != CKR_OK) {
        fprintf(stderr, "Failed to call C_CloseSession: %1$ld (0x%1$02lx)\n", rv);
        return -1;
    }
    rv = p11Func->C_Finalize(NULL);
    if (rv != CKR_OK) {
        fprintf(stderr, "Failed to call C_Finalize: %1$ld (0x%1$02lx)\n", rv);
        return -1;
    }

    /* Cleanup OpenSSL */
    cleanup_openssl();

    return 0;
}
