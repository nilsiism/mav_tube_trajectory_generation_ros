set(MOSEK_LIBPATH
        /opt/mosek/8/tools/platform/linux64x86/bin)

find_library(MOSEK_LIBRARY mosek64 PATH ${MOSEK_LIBPATH})
find_library(FUSION_LIBRARY fusion64 PATH ${MOSEK_LIBPATH})
message(STATUS "Find mosek lib ${MOSEK_LIBRARY}")

set(MOSEK_LIBRARY
        ${MOSEK_LIBRARY} ${FUSION_LIBRARY}
        )

INCLUDE (CheckIncludeFiles)

find_path(MOSEK_INCLUDE_DIR h/mosek.h
        PATH /opt/mosek/8/tools/platform/linux64x86
        )

set(MOSEK_INCLUDE_DIR ${MOSEK_INCLUDE_DIR} "/opt/mosek/8/tools/platform/linux64x86/h")

if (MOSEK_LIBRARY AND MOSEK_INCLUDE_DIR)
    set(MOSEK_FOUND TRUE)
endif (MOSEK_LIBRARY AND MOSEK_INCLUDE_DIR)

if (MOSEK_FOUND)
    message(STATUS "Found mosek headers at ${MOSEK_INCLUDE_DIR}")
else (MOSEK_FOUND)
    message(STATUS "Mosek not found")
endif (MOSEK_FOUND)