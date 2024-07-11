# CMake generated Testfile for 
# Source directory: C:/Users/slaph/src/diyrootkek/aws-cloudhsm-pkcs11-examples/src/wrapping
# Build directory: C:/Users/slaph/src/diyrootkek/aws-cloudhsm-pkcs11-examples/src/wrapping
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(aes_gcm_wrapping "aes_gcm_wrapping" "--pin" ":")
set_tests_properties(aes_gcm_wrapping PROPERTIES  _BACKTRACE_TRIPLES "C:/Users/slaph/src/diyrootkek/aws-cloudhsm-pkcs11-examples/src/wrapping/CMakeLists.txt;22;add_test;C:/Users/slaph/src/diyrootkek/aws-cloudhsm-pkcs11-examples/src/wrapping/CMakeLists.txt;0;")
add_test(aes_no_padding_wrapping "aes_no_padding_wrapping" "--pin" ":")
set_tests_properties(aes_no_padding_wrapping PROPERTIES  _BACKTRACE_TRIPLES "C:/Users/slaph/src/diyrootkek/aws-cloudhsm-pkcs11-examples/src/wrapping/CMakeLists.txt;23;add_test;C:/Users/slaph/src/diyrootkek/aws-cloudhsm-pkcs11-examples/src/wrapping/CMakeLists.txt;0;")
add_test(aes_zero_padding_wrapping "aes_zero_padding_wrapping" "--pin" ":")
set_tests_properties(aes_zero_padding_wrapping PROPERTIES  _BACKTRACE_TRIPLES "C:/Users/slaph/src/diyrootkek/aws-cloudhsm-pkcs11-examples/src/wrapping/CMakeLists.txt;24;add_test;C:/Users/slaph/src/diyrootkek/aws-cloudhsm-pkcs11-examples/src/wrapping/CMakeLists.txt;0;")
add_test(aes_wrapping "aes_wrapping" "--pin" ":")
set_tests_properties(aes_wrapping PROPERTIES  _BACKTRACE_TRIPLES "C:/Users/slaph/src/diyrootkek/aws-cloudhsm-pkcs11-examples/src/wrapping/CMakeLists.txt;25;add_test;C:/Users/slaph/src/diyrootkek/aws-cloudhsm-pkcs11-examples/src/wrapping/CMakeLists.txt;0;")
add_test(rsa_wrapping "rsa_wrapping" "--pin" ":")
set_tests_properties(rsa_wrapping PROPERTIES  _BACKTRACE_TRIPLES "C:/Users/slaph/src/diyrootkek/aws-cloudhsm-pkcs11-examples/src/wrapping/CMakeLists.txt;26;add_test;C:/Users/slaph/src/diyrootkek/aws-cloudhsm-pkcs11-examples/src/wrapping/CMakeLists.txt;0;")
add_test(wrap_with_template "wrap_with_template" "--pin" ":")
set_tests_properties(wrap_with_template PROPERTIES  _BACKTRACE_TRIPLES "C:/Users/slaph/src/diyrootkek/aws-cloudhsm-pkcs11-examples/src/wrapping/CMakeLists.txt;27;add_test;C:/Users/slaph/src/diyrootkek/aws-cloudhsm-pkcs11-examples/src/wrapping/CMakeLists.txt;0;")
add_test(unwrap_with_template "unwrap_with_template" "--pin" ":" "--wp_key")
set_tests_properties(unwrap_with_template PROPERTIES  _BACKTRACE_TRIPLES "C:/Users/slaph/src/diyrootkek/aws-cloudhsm-pkcs11-examples/src/wrapping/CMakeLists.txt;28;add_test;C:/Users/slaph/src/diyrootkek/aws-cloudhsm-pkcs11-examples/src/wrapping/CMakeLists.txt;0;")
