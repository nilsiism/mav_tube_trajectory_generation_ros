INCLUDE (CheckIncludeFiles)

find_path(FUSION_INCLUDE_DIR h/fusion.h
		PATH /opt/mosek/8/tools/platform/linux64x86
		)

if (FUSION_INCLUDE_DIR)
	set(FUSION_FOUND TRUE)
endif (FUSION_INCLUDE_DIR)

if (FUSION_FOUND)
	message(STATUS "Found supereight headers at ${FUSION_INCLUDE_DIR}")
else (FUSION_FOUND)
	message(STATUS "FUSION not found")
endif (FUSION_FOUND)
