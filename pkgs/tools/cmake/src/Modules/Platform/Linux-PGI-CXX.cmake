SET(CMAKE_SHARED_LIBRARY_LINK_C_FLAGS "")

SET (CMAKE_CXX_CREATE_PREPROCESSED_SOURCE "<CMAKE_CXX_COMPILER> <DEFINES> <FLAGS> -E <SOURCE> > <PREPROCESSED_SOURCE>")
SET (CMAKE_CXX_CREATE_ASSEMBLY_SOURCE "<CMAKE_CXX_COMPILER> <DEFINES> <FLAGS> -S <SOURCE> -o <ASSEMBLY_SOURCE>")
