#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
#include <fcntl.h>
#include <getopt.h>
#include <errno.h>
#include <memory.h>

#include "common.h"
#include "io.h"


//static void RSA_get0_key(const BIGNUM, const BIGNUM , const BIGNUM, const BIGNUM , const BIGNUM , const BIGNUM );


//static void RSA_get0_key(const *BIGNUM, const **BIGNUM , const **BIGNUM, const **BIGNUM , const **BIGNUM , const **BIGNUM );


static void show_help() {
    printf("Import a public key into the HSM.\n");
    printf("This key will have the CKA_WRAP attribute set so it can be used to wrap out other keys.\n");
    printf("\n\t--pem\t<path to public key pem>");
    printf("\n\t--pin\t\t<user:password>\n\t[--library\t<path/to/pkcs11>]\n\n");
}

struct import_args {
    char *pin;
    char *library;
    char *pem_file;
};

static int get_import_args(int argc, char **argv, struct import_args *args) {
    if (!args || !argv) {
        return -1;
    }

    int c;
    char *pin = NULL;
    char *library = NULL;
    char *pem_file = NULL;

    while (1) {
        static struct option long_options[] =
                {
                        {"pin",     required_argument, 0, 0},
                        {"library", required_argument, 0, 0},
                        {"pem", required_argument, 0, 0},
                        {0, 0,                         0, 0}
                };

        int option_index = 0;

        c = getopt_long(argc, argv, "",
                        long_options, &option_index);

        if (c == -1)
            break;

        switch (option_index) {
            case 0:
                pin = optarg;
                break;

            case 1:
                library = optarg;
                break;

            case 2:
                pem_file = optarg;
                break;

            default:
                printf("Unknown arguments");
                show_help();
                return -1;
        }
    }

    if (!pin || !pem_file ) {
        show_help();
        return -1;
    }

    args->pin = pin;
    args->library = library;
    args->pem_file = pem_file;

    // Default to the standard CloudHSM PKCS#11 library location.
    if (!args->library) {
        args->library = "/opt/cloudhsm/lib/libcloudhsm_pkcs11.so";
    }

    return 0;
}



#if OPENSSL_VERSION_NUMBER < 0x10100005L
//static void RSA_get0_key(const RSA *r, const BIGNUM **n, const BIGNUM **e, const BIGNUM **d, const BIGNUM **p, const BIGNUM **q)
//{
//	  if(n != NULL)
 //       	*n = r->n;
//
  // 	 if(e != NULL)
    //    	*e = r->e;

 //	if(d != NULL)
   //     	*d = r->d;

   // if(p != NULL)
     //   	*p = r->p;

   // if(q != NULL)
     //   	*q = r->q;
//}
#endif


int main(int argc, char **argv) {
    CK_RV rv;
    CK_SESSION_HANDLE session;
    int rc = 1;

    struct import_args args = {0};
    if (get_import_args(argc, argv, &args) < 0) {
        return rc;
    }

    rv = pkcs11_initialize(args.library);
    if (CKR_OK != rv) {
        return rc;
    }

    rv = pkcs11_open_session(args.pin, &session);
    if (CKR_OK != rv) {
        return rc;
    }

    /* Read the pem file into an RSA struct to we can access the exponent and modulus */
    RSA *key = read_RSA_PUBKEY(args.pem_file);
    if (NULL==key) {
        fprintf(stderr, "Could not read the RSA key\n");
        return rc;
    }




//	const BIGNUM *bn_p;
//	const BIGNUM *bn_q;
	const BIGNUM *bn_e;
	const BIGNUM *bn_n;


	RSA_get0_key(key, &bn_n , &bn_e, NULL);


    CK_ULONG pub_exp_len = BN_num_bytes(bn_e);
    CK_BYTE *pub_exp = malloc(pub_exp_len);
    if (pub_exp == NULL) {
        fprintf(stderr, "Failed to allocate memory for exponent: %s\n", strerror(errno));
        return rc;
    }
    BN_bn2bin(bn_e, pub_exp);

    CK_ULONG modulus_len = BN_num_bytes(bn_n);
    CK_BYTE *modulus = malloc(modulus_len);
    if (modulus == NULL) {
        fprintf(stderr, "Failed to allocate memory for modulus: %s\n", strerror(errno));
        return rc;
    }
    BN_bn2bin(bn_n, modulus);

    RSA_free(key);

    /* Using the modulus and exponent from above, we can "import" the key by creating
     * an object with the appropriate attributes.
     */
    CK_OBJECT_HANDLE pub_key = CK_INVALID_HANDLE;
    CK_OBJECT_CLASS pub_key_class = CKO_PUBLIC_KEY;
    CK_KEY_TYPE key_type = CKK_RSA;

    CK_ATTRIBUTE pub_tmpl[] = {
            {CKA_KEY_TYPE,        &key_type,      sizeof(key_type)},
            {CKA_CLASS,           &pub_key_class, sizeof(pub_key_class)},
            {CKA_MODULUS,         modulus,        modulus_len},
            {CKA_PUBLIC_EXPONENT, pub_exp,        pub_exp_len},
            {CKA_TOKEN,           &true_val,      sizeof(CK_BBOOL)},
            {CKA_WRAP,            &true_val,      sizeof(CK_BBOOL)}
    };
    rv = funcs->C_CreateObject(session, pub_tmpl, sizeof(pub_tmpl) / sizeof(CK_ATTRIBUTE), &pub_key);
    if (CKR_OK != rv) {
        fprintf(stderr, "Failed to create object %lu\n", rv);
        return rc;
    }
    printf("Imported the public key as %lu\n", pub_key);

    pkcs11_finalize_session(session);
    return rv;
}
