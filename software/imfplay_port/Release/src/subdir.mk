################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
LD_SRCS += \
../src/lscript.ld 

C_SRCS += \
../src/audio_demo.c \
../src/imfplay.c \
../src/mfs_filesys.c \
../src/mfs_filesys_util.c \
../src/platform.c \
../src/timer_ps.c 

CPP_SRCS += \
../src/main.cpp 

OBJS += \
./src/audio_demo.o \
./src/imfplay.o \
./src/main.o \
./src/mfs_filesys.o \
./src/mfs_filesys_util.o \
./src/platform.o \
./src/timer_ps.o 

C_DEPS += \
./src/audio_demo.d \
./src/imfplay.d \
./src/mfs_filesys.d \
./src/mfs_filesys_util.d \
./src/platform.d \
./src/timer_ps.d 

CPP_DEPS += \
./src/main.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM g++ compiler'
	arm-xilinx-eabi-g++ -Wall -O2 -c -fmessage-length=0 -MT"$@" -I../../opl3_standalone_bsp_0/ps7_cortexa9_0/include -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/%.o: ../src/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: ARM g++ compiler'
	arm-xilinx-eabi-g++ -Wall -O2 -c -fmessage-length=0 -MT"$@" -I../../opl3_standalone_bsp_0/ps7_cortexa9_0/include -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


