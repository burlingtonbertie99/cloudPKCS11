# CMake generated Testfile for 
# Source directory: C:/Users/slaph/src/diyrootkek/aws-cloudhsm-pkcs11-examples/src/session
# Build directory: C:/Users/slaph/src/diyrootkek/aws-cloudhsm-pkcs11-examples/build/src/session
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(login_state "login_state" "--pin" ":")
set_tests_properties(login_state PROPERTIES  _BACKTRACE_TRIPLES "C:/Users/slaph/src/diyrootkek/aws-cloudhsm-pkcs11-examples/src/session/CMakeLists.txt;11;add_test;C:/Users/slaph/src/diyrootkek/aws-cloudhsm-pkcs11-examples/src/session/CMakeLists.txt;0;")
add_test(session_keys "login_state" "--pin" ":")
set_tests_properties(session_keys PROPERTIES  _BACKTRACE_TRIPLES "C:/Users/slaph/src/diyrootkek/aws-cloudhsm-pkcs11-examples/src/session/CMakeLists.txt;12;add_test;C:/Users/slaph/src/diyrootkek/aws-cloudhsm-pkcs11-examples/src/session/CMakeLists.txt;0;")
