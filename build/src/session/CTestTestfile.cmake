# CMake generated Testfile for 
# Source directory: E:/shallow/cloudPKCS11/src/session
# Build directory: E:/shallow/cloudPKCS11/build/src/session
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(login_state "login_state" "--pin" ":")
set_tests_properties(login_state PROPERTIES  _BACKTRACE_TRIPLES "E:/shallow/cloudPKCS11/src/session/CMakeLists.txt;11;add_test;E:/shallow/cloudPKCS11/src/session/CMakeLists.txt;0;")
add_test(session_keys "login_state" "--pin" ":")
set_tests_properties(session_keys PROPERTIES  _BACKTRACE_TRIPLES "E:/shallow/cloudPKCS11/src/session/CMakeLists.txt;12;add_test;E:/shallow/cloudPKCS11/src/session/CMakeLists.txt;0;")
