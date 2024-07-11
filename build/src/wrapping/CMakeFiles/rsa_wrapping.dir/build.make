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
include src/wrapping/CMakeFiles/rsa_wrapping.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include src/wrapping/CMakeFiles/rsa_wrapping.dir/compiler_depend.make

# Include the progress variables for this target.
include src/wrapping/CMakeFiles/rsa_wrapping.dir/progress.make

# Include the compile flags for this target's objects.
include src/wrapping/CMakeFiles/rsa_wrapping.dir/flags.make

src/wrapping/CMakeFiles/rsa_wrapping.dir/rsa_wrapping.c.o: src/wrapping/CMakeFiles/rsa_wrapping.dir/flags.make
src/wrapping/CMakeFiles/rsa_wrapping.dir/rsa_wrapping.c.o: ../src/wrapping/rsa_wrapping.c
src/wrapping/CMakeFiles/rsa_wrapping.dir/rsa_wrapping.c.o: src/wrapping/CMakeFiles/rsa_wrapping.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object src/wrapping/CMakeFiles/rsa_wrapping.dir/rsa_wrapping.c.o"
	cd /home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/build/src/wrapping && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT src/wrapping/CMakeFiles/rsa_wrapping.dir/rsa_wrapping.c.o -MF CMakeFiles/rsa_wrapping.dir/rsa_wrapping.c.o.d -o CMakeFiles/rsa_wrapping.dir/rsa_wrapping.c.o -c /home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/src/wrapping/rsa_wrapping.c

src/wrapping/CMakeFiles/rsa_wrapping.dir/rsa_wrapping.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/rsa_wrapping.dir/rsa_wrapping.c.i"
	cd /home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/build/src/wrapping && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/src/wrapping/rsa_wrapping.c > CMakeFiles/rsa_wrapping.dir/rsa_wrapping.c.i

src/wrapping/CMakeFiles/rsa_wrapping.dir/rsa_wrapping.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/rsa_wrapping.dir/rsa_wrapping.c.s"
	cd /home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/build/src/wrapping && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/src/wrapping/rsa_wrapping.c -o CMakeFiles/rsa_wrapping.dir/rsa_wrapping.c.s

# Object files for target rsa_wrapping
rsa_wrapping_OBJECTS = \
"CMakeFiles/rsa_wrapping.dir/rsa_wrapping.c.o"

# External object files for target rsa_wrapping
rsa_wrapping_EXTERNAL_OBJECTS =

src/wrapping/rsa_wrapping: src/wrapping/CMakeFiles/rsa_wrapping.dir/rsa_wrapping.c.o
src/wrapping/rsa_wrapping: src/wrapping/CMakeFiles/rsa_wrapping.dir/build.make
src/wrapping/rsa_wrapping: src/common/libcloudhsmpkcs11.a
src/wrapping/rsa_wrapping: src/wrapping/CMakeFiles/rsa_wrapping.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable rsa_wrapping"
	cd /home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/build/src/wrapping && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/rsa_wrapping.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/wrapping/CMakeFiles/rsa_wrapping.dir/build: src/wrapping/rsa_wrapping
.PHONY : src/wrapping/CMakeFiles/rsa_wrapping.dir/build

src/wrapping/CMakeFiles/rsa_wrapping.dir/clean:
	cd /home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/build/src/wrapping && $(CMAKE_COMMAND) -P CMakeFiles/rsa_wrapping.dir/cmake_clean.cmake
.PHONY : src/wrapping/CMakeFiles/rsa_wrapping.dir/clean

src/wrapping/CMakeFiles/rsa_wrapping.dir/depend:
	cd /home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples /home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/src/wrapping /home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/build /home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/build/src/wrapping /home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/build/src/wrapping/CMakeFiles/rsa_wrapping.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/wrapping/CMakeFiles/rsa_wrapping.dir/depend

