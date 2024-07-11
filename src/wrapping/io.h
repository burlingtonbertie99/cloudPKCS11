
#ifndef AWS_CLOUDHSM_PKCS11_EXAMPLES_IO_H
#define AWS_CLOUDHSM_PKCS11_EXAMPLES_IO_H

#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/stat.h>
//#include <unistd.h>
#include <fcntl.h>

//#include <openssl/pem.h>
//#include <openssl/err.h>


#include <openssl/conf.h>
#include <openssl/evp.h>
#include <openssl/err.h>
#include <openssl/bio.h>
#include <openssl/rsa.h>
#include <openssl/pem.h>
#include <openssl/bn.h>


#include "cryptoki.h"


size_t write_wrapped_key(char *path, char *bytes, size_t len);
RSA *read_RSA_PUBKEY(char *path);

#endif //AWS_CLOUDHSM_PKCS11_EXAMPLES_IO_H
