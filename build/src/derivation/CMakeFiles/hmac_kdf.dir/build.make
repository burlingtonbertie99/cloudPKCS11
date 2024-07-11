# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/build

# Include any dependencies generated for this target.
include src/derivation/CMakeFiles/hmac_kdf.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include src/derivation/CMakeFiles/hmac_kdf.dir/compiler_depend.make

# Include the progress variables for this target.
include src/derivation/CMakeFiles/hmac_kdf.dir/progress.make

# Include the compile flags for this target's objects.
include src/derivation/CMakeFiles/hmac_kdf.dir/flags.make

src/derivation/CMakeFiles/hmac_kdf.dir/hmac_kdf.c.o: src/derivation/CMakeFiles/hmac_kdf.dir/flags.make
src/derivation/CMakeFiles/hmac_kdf.dir/hmac_kdf.c.o: ../src/derivation/hmac_kdf.c
src/derivation/CMakeFiles/hmac_kdf.dir/hmac_kdf.c.o: src/derivation/CMakeFiles/hmac_kdf.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object src/derivation/CMakeFiles/hmac_kdf.dir/hmac_kdf.c.o"
	cd /home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/build/src/derivation && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT src/derivation/CMakeFiles/hmac_kdf.dir/hmac_kdf.c.o -MF CMakeFiles/hmac_kdf.dir/hmac_kdf.c.o.d -o CMakeFiles/hmac_kdf.dir/hmac_kdf.c.o -c /home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/src/derivation/hmac_kdf.c

src/derivation/CMakeFiles/hmac_kdf.dir/hmac_kdf.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/hmac_kdf.dir/hmac_kdf.c.i"
	cd /home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/build/src/derivation && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/src/derivation/hmac_kdf.c > CMakeFiles/hmac_kdf.dir/hmac_kdf.c.i

src/derivation/CMakeFiles/hmac_kdf.dir/hmac_kdf.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/hmac_kdf.dir/hmac_kdf.c.s"
	cd /home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/build/src/derivation && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/src/derivation/hmac_kdf.c -o CMakeFiles/hmac_kdf.dir/hmac_kdf.c.s

# Object files for target hmac_kdf
hmac_kdf_OBJECTS = \
"CMakeFiles/hmac_kdf.dir/hmac_kdf.c.o"

# External object files for target hmac_kdf
hmac_kdf_EXTERNAL_OBJECTS =

src/derivation/hmac_kdf: src/derivation/CMakeFiles/hmac_kdf.dir/hmac_kdf.c.o
src/derivation/hmac_kdf: src/derivation/CMakeFiles/hmac_kdf.dir/build.make
src/derivation/hmac_kdf: src/common/libcloudhsmpkcs11.a
src/derivation/hmac_kdf: src/derivation/CMakeFiles/hmac_kdf.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable hmac_kdf"
	cd /home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/build/src/derivation && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/hmac_kdf.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/derivation/CMakeFiles/hmac_kdf.dir/build: src/derivation/hmac_kdf
.PHONY : src/derivation/CMakeFiles/hmac_kdf.dir/build

src/derivation/CMakeFiles/hmac_kdf.dir/clean:
	cd /home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/build/src/derivation && $(CMAKE_COMMAND) -P CMakeFiles/hmac_kdf.dir/cmake_clean.cmake
.PHONY : src/derivation/CMakeFiles/hmac_kdf.dir/clean

src/derivation/CMakeFiles/hmac_kdf.dir/depend:
	cd /home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples /home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/src/derivation /home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/build /home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/build/src/derivation /home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/build/src/derivation/CMakeFiles/hmac_kdf.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/derivation/CMakeFiles/hmac_kdf.dir/depend

