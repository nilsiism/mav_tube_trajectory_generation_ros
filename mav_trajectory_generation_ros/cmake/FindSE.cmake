INCLUDE (CheckIncludeFiles)

find_path(SE_INCLUDE_DIR se/octree.hpp
		PATH /usr/local/include
		)

if (SE_INCLUDE_DIR)
	set(SE_FOUND TRUE)
endif (SE_INCLUDE_DIR)

if (SE_FOUND)
	message(STATUS "Found supereight headers at ${SE_INCLUDE_DIR}")
else (SE_FOUND)
	message(STATUS "SE not found")
endif (SE_FOUND)
