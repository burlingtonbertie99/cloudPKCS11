# CMake generated Testfile for 
# Source directory: E:/shallow/cloudPKCS11/src/generate
# Build directory: E:/shallow/cloudPKCS11/build/src/generate
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(aes_generate "aes_generate" "--pin" ":")
set_tests_properties(aes_generate PROPERTIES  _BACKTRACE_TRIPLES "E:/shallow/cloudPKCS11/src/generate/CMakeLists.txt;12;add_test;E:/shallow/cloudPKCS11/src/generate/CMakeLists.txt;0;")
add_test(rsa_generate "rsa_generate" "--pin" ":")
set_tests_properties(rsa_generate PROPERTIES  _BACKTRACE_TRIPLES "E:/shallow/cloudPKCS11/src/generate/CMakeLists.txt;13;add_test;E:/shallow/cloudPKCS11/src/generate/CMakeLists.txt;0;")
add_test(ec_generate "ec_generate" "--pin" ":")
set_tests_properties(ec_generate PROPERTIES  _BACKTRACE_TRIPLES "E:/shallow/cloudPKCS11/src/generate/CMakeLists.txt;14;add_test;E:/shallow/cloudPKCS11/src/generate/CMakeLists.txt;0;")
