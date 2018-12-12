INCLUDE (CheckIncludeFiles)

find_path(MK_INCLUDE_DIR mosek.h
		PATH /opt/mosek/8/tools/platform/linux64x86/h
		)

if (MK_INCLUDE_DIR)
	set(MK_FOUND TRUE)
endif (MK_INCLUDE_DIR)

if (MK_FOUND)
	message(STATUS "Found supereight headers at ${MK_INCLUDE_DIR}")
else (MK_FOUND)
	message(STATUS "MK not found")
endif (MK_FOUND)
