set(MAV_LIBPATH
		/usr/local/lib)

find_library(MAV_LIBRARY mav_tube_trajectory_generation PATH ${MAV_LIBPATH})
message(STATUS "Find mav_tube_trajectory_generation lib ${MAV_LIBRARY}")

set(MAV_LIBRARY
		${MAV_LIBRARY}
		)

INCLUDE (CheckIncludeFiles)

find_path(MAV_INCLUDE_DIR mav_tube_trajectory_generation/polynomial.h
		PATH /usr/local/include
		)

if (MAV_LIBRARY AND MAV_INCLUDE_DIR)
	set(MAV_FOUND TRUE)
endif (MAV_LIBRARY AND MAV_INCLUDE_DIR)

if (MAV_FOUND)
	message(STATUS "Found mav_tube_trajecotry_generation headers at ${MAV_INCLUDE_DIR}")
else (MAV_FOUND)
	message(STATUS "MAV not found")
endif (MAV_FOUND)
