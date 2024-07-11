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
include src/generate/CMakeFiles/ec_generate.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include src/generate/CMakeFiles/ec_generate.dir/compiler_depend.make

# Include the progress variables for this target.
include src/generate/CMakeFiles/ec_generate.dir/progress.make

# Include the compile flags for this target's objects.
include src/generate/CMakeFiles/ec_generate.dir/flags.make

src/generate/CMakeFiles/ec_generate.dir/ec_generate.c.o: src/generate/CMakeFiles/ec_generate.dir/flags.make
src/generate/CMakeFiles/ec_generate.dir/ec_generate.c.o: ../src/generate/ec_generate.c
src/generate/CMakeFiles/ec_generate.dir/ec_generate.c.o: src/generate/CMakeFiles/ec_generate.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object src/generate/CMakeFiles/ec_generate.dir/ec_generate.c.o"
	cd /home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/build/src/generate && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT src/generate/CMakeFiles/ec_generate.dir/ec_generate.c.o -MF CMakeFiles/ec_generate.dir/ec_generate.c.o.d -o CMakeFiles/ec_generate.dir/ec_generate.c.o -c /home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/src/generate/ec_generate.c

src/generate/CMakeFiles/ec_generate.dir/ec_generate.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ec_generate.dir/ec_generate.c.i"
	cd /home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/build/src/generate && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/src/generate/ec_generate.c > CMakeFiles/ec_generate.dir/ec_generate.c.i

src/generate/CMakeFiles/ec_generate.dir/ec_generate.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ec_generate.dir/ec_generate.c.s"
	cd /home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/build/src/generate && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/src/generate/ec_generate.c -o CMakeFiles/ec_generate.dir/ec_generate.c.s

# Object files for target ec_generate
ec_generate_OBJECTS = \
"CMakeFiles/ec_generate.dir/ec_generate.c.o"

# External object files for target ec_generate
ec_generate_EXTERNAL_OBJECTS =

src/generate/ec_generate: src/generate/CMakeFiles/ec_generate.dir/ec_generate.c.o
src/generate/ec_generate: src/generate/CMakeFiles/ec_generate.dir/build.make
src/generate/ec_generate: src/common/libcloudhsmpkcs11.a
src/generate/ec_generate: src/generate/CMakeFiles/ec_generate.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable ec_generate"
	cd /home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/build/src/generate && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/ec_generate.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/generate/CMakeFiles/ec_generate.dir/build: src/generate/ec_generate
.PHONY : src/generate/CMakeFiles/ec_generate.dir/build

src/generate/CMakeFiles/ec_generate.dir/clean:
	cd /home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/build/src/generate && $(CMAKE_COMMAND) -P CMakeFiles/ec_generate.dir/cmake_clean.cmake
.PHONY : src/generate/CMakeFiles/ec_generate.dir/clean

src/generate/CMakeFiles/ec_generate.dir/depend:
	cd /home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples /home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/src/generate /home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/build /home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/build/src/generate /home/ec2-user/hsm_api/aws-cloudhsm-pkcs11-examples/build/src/generate/CMakeFiles/ec_generate.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/generate/CMakeFiles/ec_generate.dir/depend
