#ifndef __C_SAMPLES_H__
#define __C_SAMPLES_H__

#include <sys/types.h>
#include "cryptoki.h"
#include "cloudhsm_pkcs11_vendor_defs.h"

#define MAX_SIGNATURE_LENGTH 256

extern CK_FUNCTION_LIST *funcs;
extern CK_BBOOL true_val;
extern CK_BBOOL false_val;

CK_RV pkcs11_initialize(char *library_path);

CK_RV pkcs11_open_session(const CK_UTF8CHAR_PTR pin, CK_SESSION_HANDLE_PTR session);
CK_RV pkcs11_get_slot(CK_SLOT_ID *slot_id);

void pkcs11_finalize_session(CK_SESSION_HANDLE session);

struct pkcs_arguments {
    char *pin;
    char *library;
    CK_OBJECT_HANDLE wrapping_key_handle;
    CK_OBJECT_HANDLE object_handle;
};

int get_pkcs_args(int argc, char **argv, struct pkcs_arguments *args);

int bytes_to_new_hexstring(char *bytes, size_t bytes_len, unsigned char **hex);

int print_bytes_as_hex(char *bytes, size_t bytes_len);

#endif
