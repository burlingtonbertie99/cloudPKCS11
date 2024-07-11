cmake_minimum_required(VERSION 3.6)
project(cloudhsmpkcs11)

add_library(cloudhsmpkcs11 common.c pkcs11.c gopt.c common.h gopt.h)

IF (NOT WIN32)
  target_link_libraries(cloudhsmpkcs11 dl)
ENDIF()
