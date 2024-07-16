#ifndef AWS_CLOUDHSM_PKCS11_EXAMPLES_IO_H
#define AWS_CLOUDHSM_PKCS11_EXAMPLES_IO_H

#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/stat.h>
//#include <unistd.h>
#include <fcntl.h>

#include <openssl/pem.h>
#include <openssl/err.h>

size_t write_wrapped_key(char *path, char *bytes, size_t len);


// defined in my file
RSA *read_RSA_PUBKEYXXX(char *path);

#endif //AWS_CLOUDHSM_PKCS11_EXAMPLES_IO_H
