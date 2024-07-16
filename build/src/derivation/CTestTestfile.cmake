# CMake generated Testfile for 
# Source directory: E:/shallow/cloudPKCS11/src/derivation
# Build directory: E:/shallow/cloudPKCS11/build/src/derivation
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(ecdh "ecdh" "--pin" ":")
set_tests_properties(ecdh PROPERTIES  _BACKTRACE_TRIPLES "E:/shallow/cloudPKCS11/src/derivation/CMakeLists.txt;14;add_test;E:/shallow/cloudPKCS11/src/derivation/CMakeLists.txt;0;")
add_test(hmac_kdf "hmac_kdf" "--pin" ":")
set_tests_properties(hmac_kdf PROPERTIES  _BACKTRACE_TRIPLES "E:/shallow/cloudPKCS11/src/derivation/CMakeLists.txt;15;add_test;E:/shallow/cloudPKCS11/src/derivation/CMakeLists.txt;0;")
add_test(aes_cmac_kdf "aes_cmac_kdf" "--pin" ":")
set_tests_properties(aes_cmac_kdf PROPERTIES  _BACKTRACE_TRIPLES "E:/shallow/cloudPKCS11/src/derivation/CMakeLists.txt;16;add_test;E:/shallow/cloudPKCS11/src/derivation/CMakeLists.txt;0;")
