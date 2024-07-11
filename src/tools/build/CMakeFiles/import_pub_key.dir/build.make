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
CMAKE_SOURCE_DIR = /home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/src/tools

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/src/tools/build

# Include any dependencies generated for this target.
include CMakeFiles/import_pub_key.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/import_pub_key.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/import_pub_key.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/import_pub_key.dir/flags.make

CMakeFiles/import_pub_key.dir/import_pub_key.c.o: CMakeFiles/import_pub_key.dir/flags.make
CMakeFiles/import_pub_key.dir/import_pub_key.c.o: ../import_pub_key.c
CMakeFiles/import_pub_key.dir/import_pub_key.c.o: CMakeFiles/import_pub_key.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/src/tools/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/import_pub_key.dir/import_pub_key.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/import_pub_key.dir/import_pub_key.c.o -MF CMakeFiles/import_pub_key.dir/import_pub_key.c.o.d -o CMakeFiles/import_pub_key.dir/import_pub_key.c.o -c /home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/src/tools/import_pub_key.c

CMakeFiles/import_pub_key.dir/import_pub_key.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/import_pub_key.dir/import_pub_key.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/src/tools/import_pub_key.c > CMakeFiles/import_pub_key.dir/import_pub_key.c.i

CMakeFiles/import_pub_key.dir/import_pub_key.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/import_pub_key.dir/import_pub_key.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/src/tools/import_pub_key.c -o CMakeFiles/import_pub_key.dir/import_pub_key.c.s

CMakeFiles/import_pub_key.dir/io.c.o: CMakeFiles/import_pub_key.dir/flags.make
CMakeFiles/import_pub_key.dir/io.c.o: ../io.c
CMakeFiles/import_pub_key.dir/io.c.o: CMakeFiles/import_pub_key.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/src/tools/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/import_pub_key.dir/io.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/import_pub_key.dir/io.c.o -MF CMakeFiles/import_pub_key.dir/io.c.o.d -o CMakeFiles/import_pub_key.dir/io.c.o -c /home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/src/tools/io.c

CMakeFiles/import_pub_key.dir/io.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/import_pub_key.dir/io.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/src/tools/io.c > CMakeFiles/import_pub_key.dir/io.c.i

CMakeFiles/import_pub_key.dir/io.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/import_pub_key.dir/io.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/src/tools/io.c -o CMakeFiles/import_pub_key.dir/io.c.s

# Object files for target import_pub_key
import_pub_key_OBJECTS = \
"CMakeFiles/import_pub_key.dir/import_pub_key.c.o" \
"CMakeFiles/import_pub_key.dir/io.c.o"

# External object files for target import_pub_key
import_pub_key_EXTERNAL_OBJECTS =

import_pub_key: CMakeFiles/import_pub_key.dir/import_pub_key.c.o
import_pub_key: CMakeFiles/import_pub_key.dir/io.c.o
import_pub_key: CMakeFiles/import_pub_key.dir/build.make
import_pub_key: /usr/lib64/libssl.so
import_pub_key: /usr/lib64/libcrypto.so
import_pub_key: CMakeFiles/import_pub_key.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/src/tools/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking C executable import_pub_key"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/import_pub_key.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/import_pub_key.dir/build: import_pub_key
.PHONY : CMakeFiles/import_pub_key.dir/build

CMakeFiles/import_pub_key.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/import_pub_key.dir/cmake_clean.cmake
.PHONY : CMakeFiles/import_pub_key.dir/clean

CMakeFiles/import_pub_key.dir/depend:
	cd /home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/src/tools/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/src/tools /home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/src/tools /home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/src/tools/build /home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/src/tools/build /home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/src/tools/build/CMakeFiles/import_pub_key.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/import_pub_key.dir/depend
