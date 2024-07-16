#include "pkcs11.h"

#ifdef _WIN32
#pragma pack(push, cloudhsm_pkcs11_vendor_defines, 1)
#endif

#ifndef CKM_CLOUDHSM_AES_GCM
#define CKM_CLOUDHSM_AES_GCM           (CKM_VENDOR_DEFINED | CKM_AES_GCM)
#endif

#ifndef CKM_SP800_108_COUNTER_KDF

/*
HMAC/CMAC KDF Mechanism. The mechanism CKM_SP800_108_COUNTER_KDF is deprecated.
The recommended mechanism for KDF is CKM_CLOUDHSM_SP800_108_COUNTER_KDF.
*/
#define CKM_SP800_108_COUNTER_KDF      (CKM_VENDOR_DEFINED | 0x00000001UL)
#define CKM_CLOUDHSM_SP800_108_COUNTER_KDF (CKM_VENDOR_DEFINED | 0x00000001UL)

typedef struct CK_SP800_108_COUNTER_FORMAT {
    CK_ULONG   ulWidthInBits;
} CK_SP800_108_COUNTER_FORMAT;

typedef CK_SP800_108_COUNTER_FORMAT CK_PTR CK_SP800_108_COUNTER_FORMAT_PTR;

typedef struct CK_SP800_108_DKM_LENGTH_FORMAT {
    CK_ULONG  dkmLengthMethod;
    CK_ULONG  ulWidthInBits;
} CK_SP800_108_DKM_LENGTH_FORMAT;

typedef CK_SP800_108_DKM_LENGTH_FORMAT CK_PTR CK_SP800_108_DKM_LENGTH_FORMAT_PTR;

#define SP800_108_DKM_LENGTH_SUM_OF_KEYS 1
#define SP800_108_DKM_LENGTH_SUM_OF_SEGMENTS 2

typedef CK_ULONG CK_PRF_DATA_TYPE;
/* PRF data types */
#define CK_SP800_108_ITERATION_VARIABLE 0x0001
#define CK_SP800_108_DKM_LENGTH         0x0002
#define CK_SP800_108_BYTE_ARRAY         0x0003
#define SP800_108_COUNTER_FORMAT        0x0004
#define SP800_108_PRF_LABEL             0x0005
#define SP800_108_PRF_CONTEXT           0x0006
#define SP800_108_DKM_FORMAT            0x0007
#define SP800_108_BYTE_ARRAY            0x0008

typedef CK_MECHANISM_TYPE CK_PRF_TYPE;

typedef struct CK_PRF_DATA_PARAM {
    CK_PRF_DATA_TYPE   type;
    CK_VOID_PTR        pValue;
    CK_ULONG           ulValueLen;
} CK_PRF_DATA_PARAM;

typedef CK_PRF_DATA_PARAM CK_PTR CK_PRF_DATA_PARAM_PTR;

typedef struct CK_SP800_108_KDF_PARAMS {
    CK_PRF_TYPE            prftype;
    CK_ULONG               ulNumberOfDataParams;
    CK_PRF_DATA_PARAM_PTR  pDataParams;
} CK_SP800_108_KDF_PARAMS;


/* Note: CK_SP800_108_KDF_PARAMS will be sent as the mechanism parameter of
 * HMAC KDF mechanism (CKM_SP800_108_COUNTER_KDF).
 * prftype can be one of CKM_SHA_1_HMAC / SHA224_HMAC / SHA256_HMAC /
 * SHA384_HMAC / SHA512_HMAC.
 * Corresponding to the mechanism, data has to be sent. This data will be stored
 * in a buffer pointed to by pDataParams. Each data param will be of tlv form
 * For eg. if we are using counter kdf mechanism (CKM_SP800_108_COUNTER_KDF),
 * we have to send counter format, prf label, prf context and dkm format in
 * the data param buffer. Eg. {SP800_108_COUNTER_FORMAT, (pointer to buff
 * containing CK_SP800_108_COUNTER_FORMAT), length of buffer},
 * {SP800_108_PRF_LABEL, (pointer to buff containing prf label), buffer length}
 * and so on.
 */

#endif // CKM_SP800_108_COUNTER_KDF

#ifndef CKM_CLOUDHSM_AES_KEY_WRAP_NO_PAD
#define CKM_CLOUDHSM_AES_KEY_WRAP_NO_PAD        (CKM_VENDOR_DEFINED | CKM_AES_KEY_WRAP)
#endif

#ifndef CKM_CLOUDHSM_AES_KEY_WRAP_PKCS5_PAD
#define CKM_CLOUDHSM_AES_KEY_WRAP_PKCS5_PAD     (CKM_VENDOR_DEFINED | CKM_AES_KEY_WRAP_PAD)
#endif

#ifndef CKM_CLOUDHSM_AES_KEY_WRAP_ZERO_PAD
#define CKM_CLOUDHSM_AES_KEY_WRAP_ZERO_PAD     (CKM_VENDOR_DEFINED | 0x0000216FUL)
#endif

#ifdef _WIN32
#pragma pack(pop, cloudhsm_pkcs11_vendor_defines)
#endif
