#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "common.h"

//#include <windows.h>
//#include <string>
//#include <iostream>


//#include <sys/errno.h>


//#include <unistd.h>
#include <fcntl.h>
//#include <getopt.h>

//#include <dlfcn.h>

//#include "openssl/include/openssl/conf.h"

//#include "openssl/include/openssl/evp.h"
//#include "openssl/include/openssl/err.h"
//#include "openssl/include/openssl/bio.h"
//#include "openssl/include/openssl/rsa.h"
//#include "openssl/include/openssl/pem.h"
//#include "openssl/include/openssl/bn.h"


#include <openssl/conf.h>
#include <openssl/evp.h>
#include <openssl/err.h>
#include <openssl/bio.h>
#include <openssl/rsa.h>
#include <openssl/pem.h>
#include <openssl/bn.h>

#include <openssl/types.h>


#include "cryptoki.h"


static CK_BBOOL True = CK_TRUE;
static CK_BBOOL False = CK_FALSE;

static CK_FUNCTION_LIST_PTR p11Func;

static char* p11Pin;
static int p11SlotId = -1;
static int keyToWrap = -1;
//static char *p11SoName = "/opt/cloudhsm/lib/libcloudhsm_pkcs11.so";

//static char* p11SoName = "C:\\Users\\slaph\\src\\diyrootkek\\PrimeInk_pkcs11.so";

static char* p11SoName = "C:\\Users\\slaph\\OneDrive\\Desktop\\Windows_x64\\PortalPKCS11.dll";


//static char* pubKeyName = "trusted.pem";


// explain where public key came from....
static char* pubKeyName = "C:\\Users\\slaph\\src\\diyrootkek\\aws-cloudhsm-pkcs11-examples\\build\\src\\tools\\Debug\\trusted.pem";
static char* wrappedKeyName = "C:\\Users\\slaph\\src\\diyrootkek\\aws-cloudhsm-pkcs11-examples\\build\\src\\tools\\Debug\\wrapped.key";

void initialize_openssl()
{
    ERR_load_crypto_strings();
    OPENSSL_config(NULL);
}

void cleanup_openssl()
{
    CRYPTO_cleanup_all_ex_data();
    ERR_free_strings();
}




/**
 * Generate an AES key that can be wrapped by an RSA key.
 * @param session
 * @param key_length_bytes
 * @param key
 * @return
 */
CK_RV generate_aes_key(CK_SESSION_HANDLE session,
    CK_ULONG key_length_bytes,
    CK_OBJECT_HANDLE_PTR key) {
    CK_RV rv;
    CK_MECHANISM mech;

    mech.mechanism = CKM_AES_KEY_GEN;
    mech.ulParameterLen = 0;
    mech.pParameter = NULL;

    CK_ATTRIBUTE template[] = {
            {CKA_TOKEN,     &true_val,             sizeof(CK_BBOOL)},
            {CKA_ENCRYPT,   &true_val,            sizeof(CK_BBOOL)},
            {CKA_DECRYPT,   &true_val,            sizeof(CK_BBOOL)},
            {CKA_UNWRAP,   &true_val,            sizeof(CK_BBOOL)},
            {CKA_EXTRACTABLE,   &true_val,            sizeof(CK_BBOOL)},
            {CKA_VALUE_LEN, &key_length_bytes, sizeof(key_length_bytes)}
    };

    rv = funcs->C_GenerateKey(session, &mech, template, sizeof(template) / sizeof(CK_ATTRIBUTE), key);
    return rv;
}





/*
std::wstring ExePath() {
    TCHAR buffer[MAX_PATH] = { 0 };
    GetModuleFileName(NULL, buffer, MAX_PATH);
    std::wstring::size_type pos = std::wstring(buffer).find_last_of(L"\\/");
    return std::wstring(buffer).substr(0, pos);
}


*/
RSA* read_RSA_PUBKEY(char* pubkeyname)
{
    /* Read RSA Pub Key */
    RSA* rsa = RSA_new();
    if (rsa == NULL) {
        fprintf(stderr, "Failed to allocate RSA struct.\n%s\n", ERR_error_string(ERR_get_error(), NULL));
        return NULL;
    }

    // std::cout << "my directory is " << ExePath() << "\n";



    BIO* pubin = BIO_new_file(pubkeyname, "r");
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


int main(int argc, char **argv)
{

  //  printf(stdout, argv[0]);

    CK_SESSION_HANDLE session;

    struct pkcs_arguments args = {0};
    if (get_pkcs_args(argc, argv, &args) < 0) {
        return EXIT_FAILURE;
    }

    if (CKR_OK != pkcs11_initialize(args.library)) {
        return EXIT_FAILURE;
    }

    if (CKR_OK != pkcs11_open_session(args.pin, &session)) {
        return EXIT_FAILURE;
    }

    CK_SLOT_ID slot_id;
    CK_RV rv = pkcs11_get_slot(&slot_id);
    if (rv != CKR_OK) {
        printf("Could not find token in slot\n");
        return EXIT_FAILURE;
    }

//    rv = mechanisms(session, slot_id);
  //  if (CKR_OK != rv)
    //    return EXIT_FAILURE;

  //  pkcs11_finalize_session(session);
  
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
  //
  //
 /* Import RSA Pub Key */
    printf("Attempting to import RSA  key \n");


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


    printf("Calling CreateObject !!!!\n");


    /* Using the modulus and exponent from above, we can "import" the key by creating
     * an object with the appropriate attributes.
     */
    CK_OBJECT_HANDLE pub_key = CK_INVALID_HANDLE;
    CK_OBJECT_CLASS pub_key_class = CKO_PUBLIC_KEY;
    CK_KEY_TYPE key_type = CKK_RSA;

    CK_ATTRIBUTE pub_tmpl[] = {
            {CKA_KEY_TYPE,        &key_type,      sizeof(key_type)},
            {CKA_CLASS,           &pub_key_class, sizeof(pub_key_class)},
            {CKA_MODULUS,         keyModulus,     keyModulusLen},
            {CKA_PUBLIC_EXPONENT, keyExponent,    keyExponentLen},
            {CKA_TOKEN,           &false_val,      sizeof(CK_BBOOL)},
            {CKA_WRAP,            &true_val,      sizeof(CK_BBOOL)}
    };
    rv = funcs->C_CreateObject(session, pub_tmpl, sizeof(pub_tmpl) / sizeof(CK_ATTRIBUTE), &pub_key);
    if (CKR_OK != rv) {
        fprintf(stderr, "Failed to create object %lu\n", rv);
        return rv;
    }
    printf("Imported the public key as %lu\n", pub_key);


    /* Free key exponent and modulus now that they're imported */
    free(keyExponent);
    free(keyModulus);

  //  fprintf(stderr, "Modulus freed %d\n", rv);





    unsigned char* hex_array = NULL;
    CK_BYTE_PTR wrapped_key = NULL;
    CK_OBJECT_HANDLE rsa_public_key = CK_INVALID_HANDLE;
    CK_OBJECT_HANDLE rsa_private_key = CK_INVALID_HANDLE;

    // Generate a wrapping key.
    CK_OBJECT_HANDLE aes_key = CK_INVALID_HANDLE;

    
    rv = generate_aes_key(session, 32, &aes_key);
    if (rv != CKR_OK) {
        fprintf(stderr, "Wrapping key generation failed: %lu\n", rv);
        //goto done;

        return -1;
    }

    fprintf(stderr, "AES key generated %d\n", rv);


    
    /* Wrap designated key using the pub key we imported */
    CK_RSA_PKCS_OAEP_PARAMS params = { CKM_SHA256, CKG_MGF1_SHA256, CKZ_DATA_SPECIFIED, NULL, 0 };
    //CK_RSA_PKCS_OAEP_PARAMS oaep_params = { CKM_SHA_1, CKG_MGF1_SHA1, CKZ_DATA_SPECIFIED, NULL, 0 };
    //CK_MECHANISM mechanism = { CKM_RSA_PKCS_OAEP, &oaep_params, sizeof(oaep_params) };


    
    
    //CK_RSA_PKCS_OAEP_PARAMS params = { CKM_SHA_1, CKG_MGF1_SHA1 };
    CK_MECHANISM mechanism = { CKM_RSA_PKCS_OAEP, &params, sizeof(params) };



    CK_BYTE *wrappedKey = NULL;
    CK_ULONG wrappedKeyLen;
    
    
    /* This WrapKey call gets how big wrappedKey buffer needs to be */
  //  rv = funcs->C_WrapKey(session, &mechanism, pub_key, keyToWrap, wrappedKey, &wrappedKeyLen);

    rv = funcs->C_WrapKey(session, &mechanism, pub_key, aes_key, wrappedKey, &wrappedKeyLen);
    if (rv != CKR_OK) {
        //    fprintf(stderr, "Failed to call first C_WrapKey: %1$ld (0x%1$02lx)\n", rv);

        fprintf(stderr, "Failed to call first C_WrapKey: \n");

        fprintf(stderr, "%d\n",rv);
        return -1;


    }

    fprintf(stderr, "Wrapped key length =  %d\n", wrappedKeyLen);


    wrappedKey = malloc(wrappedKeyLen);
    if (wrappedKey == NULL) {
        fprintf(stderr, "Failed to allocate memory for wrapped key: %s\n", strerror(errno));
        return -1;
    }


    /* This actually wraps out the key */
    rv = funcs->C_WrapKey(session, &mechanism, pub_key, aes_key, wrappedKey, &wrappedKeyLen);
    if (rv != CKR_OK) {
        fprintf(stderr, "Failed to call second C_WrapKey: %1$ld (0x%1$02lx)\n", rv);
        return -1;
    }


    fprintf(stderr, "Wrapped key!!!   %d\n", rv);

    /* Write wrapped key to a file */
    int fd = open(wrappedKeyName, O_BINARY | O_WRONLY | O_CREAT | O_TRUNC, 0666);
    if (fd < 0) {
        fprintf(stderr, "Failed to open output file for wrapped key: %s\n", strerror(errno));
        return -1;
    }


    write(fd, wrappedKey, wrappedKeyLen);




    close(fd);


    write_wrapped_key("C:\\Users\\slaph\\src\\diyrootkek\\aws-cloudhsm-pkcs11-examples\\build\\src\\tools\\Debug\\wrappedKey2.io.bin", wrappedKey, wrappedKeyLen);


    printf("freeing wrapped key\n");
    free(wrappedKey);

    /* Cleanup PKCS11 layer */
    rv = funcs->C_CloseSession(session);
    if (rv != CKR_OK) {
        fprintf(stderr, "Failed to call C_CloseSession: %1$ld (0x%1$02lx)\n", rv);
        return -1;
    }
    rv = funcs->C_Finalize(NULL);
    if (rv != CKR_OK) {
        fprintf(stderr, "Failed to call C_Finalize: %1$ld (0x%1$02lx)\n", rv);
        return -1;
    }
printf("cleaning up\n");
    /* Cleanup OpenSSL */
    cleanup_openssl();

  
    return 0;
}
