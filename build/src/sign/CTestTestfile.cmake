# CMake generated Testfile for 
# Source directory: E:/shallow/cloudPKCS11/src/sign
# Build directory: E:/shallow/cloudPKCS11/build/src/sign
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(sign "sign" "--pin" ":")
set_tests_properties(sign PROPERTIES  _BACKTRACE_TRIPLES "E:/shallow/cloudPKCS11/src/sign/CMakeLists.txt;11;add_test;E:/shallow/cloudPKCS11/src/sign/CMakeLists.txt;0;")
add_test(multi_part_sign "multi_part_sign" "--pin" ":")
set_tests_properties(multi_part_sign PROPERTIES  _BACKTRACE_TRIPLES "E:/shallow/cloudPKCS11/src/sign/CMakeLists.txt;12;add_test;E:/shallow/cloudPKCS11/src/sign/CMakeLists.txt;0;")
