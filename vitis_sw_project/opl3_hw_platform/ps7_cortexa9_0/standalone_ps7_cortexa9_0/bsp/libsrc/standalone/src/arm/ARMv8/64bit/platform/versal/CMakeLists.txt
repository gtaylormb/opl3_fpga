# Copyright (c) 2023 Advanced Micro Devices, Inc. All Rights Reserved.
# SPDX-License-Identifier: MIT
add_subdirectory(gcc)
if("${CMAKE_MACHINE}" STREQUAL "Versal")
collect (PROJECT_LIB_HEADERS xparameters_ps.h)
endif()
