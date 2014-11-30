include_directories(${CMAKE_CURRENT_BINARY_DIR})

include(GenerateExportHeader)
add_compiler_export_flags()

add_library(ppplay_opl SHARED
	channel.cpp
	envelopegenerator.cpp
	operator.cpp
	opl3.cpp
	phasegenerator.cpp
)
generate_export_header(ppplay_opl)
set_target_properties(ppplay_opl PROPERTIES SOVERSION 1)

target_link_libraries(ppplay_opl ppplay_stream)

install(TARGETS ppplay_opl DESTINATION ${CMAKE_INSTALL_LIBDIR} EXPORT ppplayExports)
install(FILES
	opl3.h
	channel.h
	envelopegenerator.h
	operator.h
	phasegenerator.h
	${CMAKE_CURRENT_BINARY_DIR}/ppplay_opl_export.h
	DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/ppplay/opl
)

option(BUILD_IMFPLAY "Build the OPL-only IMF-Play program" ON)
if(BUILD_IMFPLAY)
	add_executable(imfplay imfplay.cpp)
	if(COMPILER_IS_CLANG)
		target_link_libraries(imfplay stdc++)
	endif()
	install(TARGETS imfplay DESTINATION ${CMAKE_INSTALL_BINDIR} COMPONENT application)
	target_link_libraries(imfplay ppplay_opl ${Boost_PROGRAM_OPTIONS_LIBRARY} ${Boost_FILESYSTEM_LIBRARY} ${Boost_SYSTEM_LIBRARY} ${SDL_LIBRARY} ppplay_stream ppplay_core)
endif()
