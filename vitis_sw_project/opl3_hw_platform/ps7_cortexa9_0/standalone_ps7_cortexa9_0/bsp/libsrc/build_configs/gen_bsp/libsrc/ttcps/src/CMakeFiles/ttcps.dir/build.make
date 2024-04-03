# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.24

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

# Produce verbose output by default.
VERBOSE = 1

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
CMAKE_COMMAND = /opt/Xilinx/Vitis/2023.2/tps/lnx64/cmake-3.24.2/bin/cmake

# The command to remove a file.
RM = /opt/Xilinx/Vitis/2023.2/tps/lnx64/cmake-3.24.2/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/gtaylor/git/opl3_fpga/vitis_sw_project/opl3_hw_platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/gtaylor/git/opl3_fpga/vitis_sw_project/opl3_hw_platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/build_configs/gen_bsp

# Include any dependencies generated for this target.
include libsrc/ttcps/src/CMakeFiles/ttcps.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include libsrc/ttcps/src/CMakeFiles/ttcps.dir/compiler_depend.make

# Include the progress variables for this target.
include libsrc/ttcps/src/CMakeFiles/ttcps.dir/progress.make

# Include the compile flags for this target's objects.
include libsrc/ttcps/src/CMakeFiles/ttcps.dir/flags.make

libsrc/ttcps/src/CMakeFiles/ttcps.dir/xttcps_options.c.obj: libsrc/ttcps/src/CMakeFiles/ttcps.dir/flags.make
libsrc/ttcps/src/CMakeFiles/ttcps.dir/xttcps_options.c.obj: /home/gtaylor/git/opl3_fpga/vitis_sw_project/opl3_hw_platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/ttcps/src/xttcps_options.c
libsrc/ttcps/src/CMakeFiles/ttcps.dir/xttcps_options.c.obj: libsrc/ttcps/src/CMakeFiles/ttcps.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/gtaylor/git/opl3_fpga/vitis_sw_project/opl3_hw_platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/build_configs/gen_bsp/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object libsrc/ttcps/src/CMakeFiles/ttcps.dir/xttcps_options.c.obj"
	cd /home/gtaylor/git/opl3_fpga/vitis_sw_project/opl3_hw_platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/build_configs/gen_bsp/libsrc/ttcps/src && /opt/Xilinx/Vitis/2023.2/gnu/aarch32/lin/gcc-arm-none-eabi/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT libsrc/ttcps/src/CMakeFiles/ttcps.dir/xttcps_options.c.obj -MF CMakeFiles/ttcps.dir/xttcps_options.c.obj.d -o CMakeFiles/ttcps.dir/xttcps_options.c.obj -c /home/gtaylor/git/opl3_fpga/vitis_sw_project/opl3_hw_platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/ttcps/src/xttcps_options.c

libsrc/ttcps/src/CMakeFiles/ttcps.dir/xttcps_options.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ttcps.dir/xttcps_options.c.i"
	cd /home/gtaylor/git/opl3_fpga/vitis_sw_project/opl3_hw_platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/build_configs/gen_bsp/libsrc/ttcps/src && /opt/Xilinx/Vitis/2023.2/gnu/aarch32/lin/gcc-arm-none-eabi/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/gtaylor/git/opl3_fpga/vitis_sw_project/opl3_hw_platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/ttcps/src/xttcps_options.c > CMakeFiles/ttcps.dir/xttcps_options.c.i

libsrc/ttcps/src/CMakeFiles/ttcps.dir/xttcps_options.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ttcps.dir/xttcps_options.c.s"
	cd /home/gtaylor/git/opl3_fpga/vitis_sw_project/opl3_hw_platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/build_configs/gen_bsp/libsrc/ttcps/src && /opt/Xilinx/Vitis/2023.2/gnu/aarch32/lin/gcc-arm-none-eabi/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/gtaylor/git/opl3_fpga/vitis_sw_project/opl3_hw_platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/ttcps/src/xttcps_options.c -o CMakeFiles/ttcps.dir/xttcps_options.c.s

libsrc/ttcps/src/CMakeFiles/ttcps.dir/xttcps_selftest.c.obj: libsrc/ttcps/src/CMakeFiles/ttcps.dir/flags.make
libsrc/ttcps/src/CMakeFiles/ttcps.dir/xttcps_selftest.c.obj: /home/gtaylor/git/opl3_fpga/vitis_sw_project/opl3_hw_platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/ttcps/src/xttcps_selftest.c
libsrc/ttcps/src/CMakeFiles/ttcps.dir/xttcps_selftest.c.obj: libsrc/ttcps/src/CMakeFiles/ttcps.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/gtaylor/git/opl3_fpga/vitis_sw_project/opl3_hw_platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/build_configs/gen_bsp/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object libsrc/ttcps/src/CMakeFiles/ttcps.dir/xttcps_selftest.c.obj"
	cd /home/gtaylor/git/opl3_fpga/vitis_sw_project/opl3_hw_platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/build_configs/gen_bsp/libsrc/ttcps/src && /opt/Xilinx/Vitis/2023.2/gnu/aarch32/lin/gcc-arm-none-eabi/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT libsrc/ttcps/src/CMakeFiles/ttcps.dir/xttcps_selftest.c.obj -MF CMakeFiles/ttcps.dir/xttcps_selftest.c.obj.d -o CMakeFiles/ttcps.dir/xttcps_selftest.c.obj -c /home/gtaylor/git/opl3_fpga/vitis_sw_project/opl3_hw_platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/ttcps/src/xttcps_selftest.c

libsrc/ttcps/src/CMakeFiles/ttcps.dir/xttcps_selftest.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ttcps.dir/xttcps_selftest.c.i"
	cd /home/gtaylor/git/opl3_fpga/vitis_sw_project/opl3_hw_platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/build_configs/gen_bsp/libsrc/ttcps/src && /opt/Xilinx/Vitis/2023.2/gnu/aarch32/lin/gcc-arm-none-eabi/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/gtaylor/git/opl3_fpga/vitis_sw_project/opl3_hw_platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/ttcps/src/xttcps_selftest.c > CMakeFiles/ttcps.dir/xttcps_selftest.c.i

libsrc/ttcps/src/CMakeFiles/ttcps.dir/xttcps_selftest.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ttcps.dir/xttcps_selftest.c.s"
	cd /home/gtaylor/git/opl3_fpga/vitis_sw_project/opl3_hw_platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/build_configs/gen_bsp/libsrc/ttcps/src && /opt/Xilinx/Vitis/2023.2/gnu/aarch32/lin/gcc-arm-none-eabi/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/gtaylor/git/opl3_fpga/vitis_sw_project/opl3_hw_platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/ttcps/src/xttcps_selftest.c -o CMakeFiles/ttcps.dir/xttcps_selftest.c.s

libsrc/ttcps/src/CMakeFiles/ttcps.dir/xttcps.c.obj: libsrc/ttcps/src/CMakeFiles/ttcps.dir/flags.make
libsrc/ttcps/src/CMakeFiles/ttcps.dir/xttcps.c.obj: /home/gtaylor/git/opl3_fpga/vitis_sw_project/opl3_hw_platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/ttcps/src/xttcps.c
libsrc/ttcps/src/CMakeFiles/ttcps.dir/xttcps.c.obj: libsrc/ttcps/src/CMakeFiles/ttcps.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/gtaylor/git/opl3_fpga/vitis_sw_project/opl3_hw_platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/build_configs/gen_bsp/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object libsrc/ttcps/src/CMakeFiles/ttcps.dir/xttcps.c.obj"
	cd /home/gtaylor/git/opl3_fpga/vitis_sw_project/opl3_hw_platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/build_configs/gen_bsp/libsrc/ttcps/src && /opt/Xilinx/Vitis/2023.2/gnu/aarch32/lin/gcc-arm-none-eabi/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT libsrc/ttcps/src/CMakeFiles/ttcps.dir/xttcps.c.obj -MF CMakeFiles/ttcps.dir/xttcps.c.obj.d -o CMakeFiles/ttcps.dir/xttcps.c.obj -c /home/gtaylor/git/opl3_fpga/vitis_sw_project/opl3_hw_platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/ttcps/src/xttcps.c

libsrc/ttcps/src/CMakeFiles/ttcps.dir/xttcps.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ttcps.dir/xttcps.c.i"
	cd /home/gtaylor/git/opl3_fpga/vitis_sw_project/opl3_hw_platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/build_configs/gen_bsp/libsrc/ttcps/src && /opt/Xilinx/Vitis/2023.2/gnu/aarch32/lin/gcc-arm-none-eabi/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/gtaylor/git/opl3_fpga/vitis_sw_project/opl3_hw_platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/ttcps/src/xttcps.c > CMakeFiles/ttcps.dir/xttcps.c.i

libsrc/ttcps/src/CMakeFiles/ttcps.dir/xttcps.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ttcps.dir/xttcps.c.s"
	cd /home/gtaylor/git/opl3_fpga/vitis_sw_project/opl3_hw_platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/build_configs/gen_bsp/libsrc/ttcps/src && /opt/Xilinx/Vitis/2023.2/gnu/aarch32/lin/gcc-arm-none-eabi/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/gtaylor/git/opl3_fpga/vitis_sw_project/opl3_hw_platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/ttcps/src/xttcps.c -o CMakeFiles/ttcps.dir/xttcps.c.s

libsrc/ttcps/src/CMakeFiles/ttcps.dir/xttcps_g.c.obj: libsrc/ttcps/src/CMakeFiles/ttcps.dir/flags.make
libsrc/ttcps/src/CMakeFiles/ttcps.dir/xttcps_g.c.obj: /home/gtaylor/git/opl3_fpga/vitis_sw_project/opl3_hw_platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/ttcps/src/xttcps_g.c
libsrc/ttcps/src/CMakeFiles/ttcps.dir/xttcps_g.c.obj: libsrc/ttcps/src/CMakeFiles/ttcps.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/gtaylor/git/opl3_fpga/vitis_sw_project/opl3_hw_platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/build_configs/gen_bsp/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object libsrc/ttcps/src/CMakeFiles/ttcps.dir/xttcps_g.c.obj"
	cd /home/gtaylor/git/opl3_fpga/vitis_sw_project/opl3_hw_platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/build_configs/gen_bsp/libsrc/ttcps/src && /opt/Xilinx/Vitis/2023.2/gnu/aarch32/lin/gcc-arm-none-eabi/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT libsrc/ttcps/src/CMakeFiles/ttcps.dir/xttcps_g.c.obj -MF CMakeFiles/ttcps.dir/xttcps_g.c.obj.d -o CMakeFiles/ttcps.dir/xttcps_g.c.obj -c /home/gtaylor/git/opl3_fpga/vitis_sw_project/opl3_hw_platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/ttcps/src/xttcps_g.c

libsrc/ttcps/src/CMakeFiles/ttcps.dir/xttcps_g.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ttcps.dir/xttcps_g.c.i"
	cd /home/gtaylor/git/opl3_fpga/vitis_sw_project/opl3_hw_platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/build_configs/gen_bsp/libsrc/ttcps/src && /opt/Xilinx/Vitis/2023.2/gnu/aarch32/lin/gcc-arm-none-eabi/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/gtaylor/git/opl3_fpga/vitis_sw_project/opl3_hw_platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/ttcps/src/xttcps_g.c > CMakeFiles/ttcps.dir/xttcps_g.c.i

libsrc/ttcps/src/CMakeFiles/ttcps.dir/xttcps_g.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ttcps.dir/xttcps_g.c.s"
	cd /home/gtaylor/git/opl3_fpga/vitis_sw_project/opl3_hw_platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/build_configs/gen_bsp/libsrc/ttcps/src && /opt/Xilinx/Vitis/2023.2/gnu/aarch32/lin/gcc-arm-none-eabi/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/gtaylor/git/opl3_fpga/vitis_sw_project/opl3_hw_platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/ttcps/src/xttcps_g.c -o CMakeFiles/ttcps.dir/xttcps_g.c.s

libsrc/ttcps/src/CMakeFiles/ttcps.dir/xttcps_sinit.c.obj: libsrc/ttcps/src/CMakeFiles/ttcps.dir/flags.make
libsrc/ttcps/src/CMakeFiles/ttcps.dir/xttcps_sinit.c.obj: /home/gtaylor/git/opl3_fpga/vitis_sw_project/opl3_hw_platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/ttcps/src/xttcps_sinit.c
libsrc/ttcps/src/CMakeFiles/ttcps.dir/xttcps_sinit.c.obj: libsrc/ttcps/src/CMakeFiles/ttcps.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/gtaylor/git/opl3_fpga/vitis_sw_project/opl3_hw_platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/build_configs/gen_bsp/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building C object libsrc/ttcps/src/CMakeFiles/ttcps.dir/xttcps_sinit.c.obj"
	cd /home/gtaylor/git/opl3_fpga/vitis_sw_project/opl3_hw_platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/build_configs/gen_bsp/libsrc/ttcps/src && /opt/Xilinx/Vitis/2023.2/gnu/aarch32/lin/gcc-arm-none-eabi/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT libsrc/ttcps/src/CMakeFiles/ttcps.dir/xttcps_sinit.c.obj -MF CMakeFiles/ttcps.dir/xttcps_sinit.c.obj.d -o CMakeFiles/ttcps.dir/xttcps_sinit.c.obj -c /home/gtaylor/git/opl3_fpga/vitis_sw_project/opl3_hw_platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/ttcps/src/xttcps_sinit.c

libsrc/ttcps/src/CMakeFiles/ttcps.dir/xttcps_sinit.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ttcps.dir/xttcps_sinit.c.i"
	cd /home/gtaylor/git/opl3_fpga/vitis_sw_project/opl3_hw_platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/build_configs/gen_bsp/libsrc/ttcps/src && /opt/Xilinx/Vitis/2023.2/gnu/aarch32/lin/gcc-arm-none-eabi/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/gtaylor/git/opl3_fpga/vitis_sw_project/opl3_hw_platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/ttcps/src/xttcps_sinit.c > CMakeFiles/ttcps.dir/xttcps_sinit.c.i

libsrc/ttcps/src/CMakeFiles/ttcps.dir/xttcps_sinit.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ttcps.dir/xttcps_sinit.c.s"
	cd /home/gtaylor/git/opl3_fpga/vitis_sw_project/opl3_hw_platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/build_configs/gen_bsp/libsrc/ttcps/src && /opt/Xilinx/Vitis/2023.2/gnu/aarch32/lin/gcc-arm-none-eabi/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/gtaylor/git/opl3_fpga/vitis_sw_project/opl3_hw_platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/ttcps/src/xttcps_sinit.c -o CMakeFiles/ttcps.dir/xttcps_sinit.c.s

# Object files for target ttcps
ttcps_OBJECTS = \
"CMakeFiles/ttcps.dir/xttcps_options.c.obj" \
"CMakeFiles/ttcps.dir/xttcps_selftest.c.obj" \
"CMakeFiles/ttcps.dir/xttcps.c.obj" \
"CMakeFiles/ttcps.dir/xttcps_g.c.obj" \
"CMakeFiles/ttcps.dir/xttcps_sinit.c.obj"

# External object files for target ttcps
ttcps_EXTERNAL_OBJECTS =

libsrc/ttcps/src/libttcps.a: libsrc/ttcps/src/CMakeFiles/ttcps.dir/xttcps_options.c.obj
libsrc/ttcps/src/libttcps.a: libsrc/ttcps/src/CMakeFiles/ttcps.dir/xttcps_selftest.c.obj
libsrc/ttcps/src/libttcps.a: libsrc/ttcps/src/CMakeFiles/ttcps.dir/xttcps.c.obj
libsrc/ttcps/src/libttcps.a: libsrc/ttcps/src/CMakeFiles/ttcps.dir/xttcps_g.c.obj
libsrc/ttcps/src/libttcps.a: libsrc/ttcps/src/CMakeFiles/ttcps.dir/xttcps_sinit.c.obj
libsrc/ttcps/src/libttcps.a: libsrc/ttcps/src/CMakeFiles/ttcps.dir/build.make
libsrc/ttcps/src/libttcps.a: libsrc/ttcps/src/CMakeFiles/ttcps.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/gtaylor/git/opl3_fpga/vitis_sw_project/opl3_hw_platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/build_configs/gen_bsp/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Linking C static library libttcps.a"
	cd /home/gtaylor/git/opl3_fpga/vitis_sw_project/opl3_hw_platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/build_configs/gen_bsp/libsrc/ttcps/src && $(CMAKE_COMMAND) -P CMakeFiles/ttcps.dir/cmake_clean_target.cmake
	cd /home/gtaylor/git/opl3_fpga/vitis_sw_project/opl3_hw_platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/build_configs/gen_bsp/libsrc/ttcps/src && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/ttcps.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
libsrc/ttcps/src/CMakeFiles/ttcps.dir/build: libsrc/ttcps/src/libttcps.a
.PHONY : libsrc/ttcps/src/CMakeFiles/ttcps.dir/build

libsrc/ttcps/src/CMakeFiles/ttcps.dir/clean:
	cd /home/gtaylor/git/opl3_fpga/vitis_sw_project/opl3_hw_platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/build_configs/gen_bsp/libsrc/ttcps/src && $(CMAKE_COMMAND) -P CMakeFiles/ttcps.dir/cmake_clean.cmake
.PHONY : libsrc/ttcps/src/CMakeFiles/ttcps.dir/clean

libsrc/ttcps/src/CMakeFiles/ttcps.dir/depend:
	cd /home/gtaylor/git/opl3_fpga/vitis_sw_project/opl3_hw_platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/build_configs/gen_bsp && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/gtaylor/git/opl3_fpga/vitis_sw_project/opl3_hw_platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp /home/gtaylor/git/opl3_fpga/vitis_sw_project/opl3_hw_platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/ttcps/src /home/gtaylor/git/opl3_fpga/vitis_sw_project/opl3_hw_platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/build_configs/gen_bsp /home/gtaylor/git/opl3_fpga/vitis_sw_project/opl3_hw_platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/build_configs/gen_bsp/libsrc/ttcps/src /home/gtaylor/git/opl3_fpga/vitis_sw_project/opl3_hw_platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/build_configs/gen_bsp/libsrc/ttcps/src/CMakeFiles/ttcps.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : libsrc/ttcps/src/CMakeFiles/ttcps.dir/depend

