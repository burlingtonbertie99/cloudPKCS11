# CMake generated Testfile for 
# Source directory: E:/shallow/cloudPKCS11/src/encrypt
# Build directory: E:/shallow/cloudPKCS11/build/src/encrypt
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(aes_cbc "aes_cbc" "--pin" ":")
set_tests_properties(aes_cbc PROPERTIES  _BACKTRACE_TRIPLES "E:/shallow/cloudPKCS11/src/encrypt/CMakeLists.txt;18;add_test;E:/shallow/cloudPKCS11/src/encrypt/CMakeLists.txt;0;")
add_test(aes_ecb "aes_ecb" "--pin" ":")
set_tests_properties(aes_ecb PROPERTIES  _BACKTRACE_TRIPLES "E:/shallow/cloudPKCS11/src/encrypt/CMakeLists.txt;19;add_test;E:/shallow/cloudPKCS11/src/encrypt/CMakeLists.txt;0;")
add_test(aes_gcm "aes_gcm" "--pin" ":")
set_tests_properties(aes_gcm PROPERTIES  _BACKTRACE_TRIPLES "E:/shallow/cloudPKCS11/src/encrypt/CMakeLists.txt;20;add_test;E:/shallow/cloudPKCS11/src/encrypt/CMakeLists.txt;0;")
add_test(aes_ctr "aes_ctr" "--pin" ":")
set_tests_properties(aes_ctr PROPERTIES  _BACKTRACE_TRIPLES "E:/shallow/cloudPKCS11/src/encrypt/CMakeLists.txt;21;add_test;E:/shallow/cloudPKCS11/src/encrypt/CMakeLists.txt;0;")
add_test(des_ecb "des_ecb" "--pin" ":")
set_tests_properties(des_ecb PROPERTIES  _BACKTRACE_TRIPLES "E:/shallow/cloudPKCS11/src/encrypt/CMakeLists.txt;22;add_test;E:/shallow/cloudPKCS11/src/encrypt/CMakeLists.txt;0;")
