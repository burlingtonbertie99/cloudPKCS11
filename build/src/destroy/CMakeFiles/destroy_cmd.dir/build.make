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
include src/destroy/CMakeFiles/destroy_cmd.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include src/destroy/CMakeFiles/destroy_cmd.dir/compiler_depend.make

# Include the progress variables for this target.
include src/destroy/CMakeFiles/destroy_cmd.dir/progress.make

# Include the compile flags for this target's objects.
include src/destroy/CMakeFiles/destroy_cmd.dir/flags.make

src/destroy/CMakeFiles/destroy_cmd.dir/destroy_cmd.c.o: src/destroy/CMakeFiles/destroy_cmd.dir/flags.make
src/destroy/CMakeFiles/destroy_cmd.dir/destroy_cmd.c.o: ../src/destroy/destroy_cmd.c
src/destroy/CMakeFiles/destroy_cmd.dir/destroy_cmd.c.o: src/destroy/CMakeFiles/destroy_cmd.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object src/destroy/CMakeFiles/destroy_cmd.dir/destroy_cmd.c.o"
	cd /home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/build/src/destroy && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT src/destroy/CMakeFiles/destroy_cmd.dir/destroy_cmd.c.o -MF CMakeFiles/destroy_cmd.dir/destroy_cmd.c.o.d -o CMakeFiles/destroy_cmd.dir/destroy_cmd.c.o -c /home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/src/destroy/destroy_cmd.c

src/destroy/CMakeFiles/destroy_cmd.dir/destroy_cmd.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/destroy_cmd.dir/destroy_cmd.c.i"
	cd /home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/build/src/destroy && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/src/destroy/destroy_cmd.c > CMakeFiles/destroy_cmd.dir/destroy_cmd.c.i

src/destroy/CMakeFiles/destroy_cmd.dir/destroy_cmd.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/destroy_cmd.dir/destroy_cmd.c.s"
	cd /home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/build/src/destroy && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/src/destroy/destroy_cmd.c -o CMakeFiles/destroy_cmd.dir/destroy_cmd.c.s

# Object files for target destroy_cmd
destroy_cmd_OBJECTS = \
"CMakeFiles/destroy_cmd.dir/destroy_cmd.c.o"

# External object files for target destroy_cmd
destroy_cmd_EXTERNAL_OBJECTS =

src/destroy/destroy_cmd: src/destroy/CMakeFiles/destroy_cmd.dir/destroy_cmd.c.o
src/destroy/destroy_cmd: src/destroy/CMakeFiles/destroy_cmd.dir/build.make
src/destroy/destroy_cmd: src/common/libcloudhsmpkcs11.a
src/destroy/destroy_cmd: src/destroy/libdestroy.a
src/destroy/destroy_cmd: src/destroy/CMakeFiles/destroy_cmd.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable destroy_cmd"
	cd /home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/build/src/destroy && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/destroy_cmd.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/destroy/CMakeFiles/destroy_cmd.dir/build: src/destroy/destroy_cmd
.PHONY : src/destroy/CMakeFiles/destroy_cmd.dir/build

src/destroy/CMakeFiles/destroy_cmd.dir/clean:
	cd /home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/build/src/destroy && $(CMAKE_COMMAND) -P CMakeFiles/destroy_cmd.dir/cmake_clean.cmake
.PHONY : src/destroy/CMakeFiles/destroy_cmd.dir/clean

src/destroy/CMakeFiles/destroy_cmd.dir/depend:
	cd /home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples /home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/src/destroy /home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/build /home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/build/src/destroy /home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/build/src/destroy/CMakeFiles/destroy_cmd.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/destroy/CMakeFiles/destroy_cmd.dir/depend
