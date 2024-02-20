SET(CMAKE_DL_LIBS "")

IF(CMAKE_SYSTEM MATCHES "OSF1-1.[012]")
ENDIF(CMAKE_SYSTEM MATCHES "OSF1-1.[012]")
IF(CMAKE_SYSTEM MATCHES "OSF1-1.*")  
  # OSF/1 1.3 from OSF using ELF, and derivatives, including AD2
  SET(CMAKE_SHARED_LIBRARY_C_FLAGS "-fpic")     # -pic 
  SET(CMAKE_SHARED_LIBRARY_CXX_FLAGS "-fpic")   # -pic
ENDIF(CMAKE_SYSTEM MATCHES "OSF1-1.*")



IF(CMAKE_SYSTEM MATCHES "OSF1-V.*")
  SET(CMAKE_SHARED_LIBRARY_CREATE_C_FLAGS "-shared -Wl,-expect_unresolved,\\*")       # -shared
  SET(CMAKE_SHARED_LIBRARY_CREATE_CXX_FLAGS "-shared -Wl,-expect_unresolved,\\*")       # -shared
  IF(CMAKE_COMPILER_IS_GNUCXX)
    SET(CMAKE_SHARED_LIBRARY_RUNTIME_CXX_FLAG "-Wl,-rpath,")  
  ELSE(CMAKE_COMPILER_IS_GNUCXX)
    SET(CMAKE_SHARED_LIBRARY_RUNTIME_CXX_FLAG "-rpath ")
  ENDIF(CMAKE_COMPILER_IS_GNUCXX)
  IF(CMAKE_COMPILER_IS_GNUCC)
    SET(CMAKE_SHARED_LIBRARY_RUNTIME_C_FLAG "-Wl,-rpath,")  
  ELSE(CMAKE_COMPILER_IS_GNUCC)
    SET(CMAKE_SHARED_LIBRARY_RUNTIME_C_FLAG "-rpath ")
  ENDIF(CMAKE_COMPILER_IS_GNUCC)
  SET(CMAKE_SHARED_LIBRARY_RUNTIME_C_FLAG_SEP ":")
ENDIF(CMAKE_SYSTEM MATCHES "OSF1-V.*")


IF(CMAKE_COMPILER_IS_GNUCXX)
  # include the gcc flags 
ELSE (CMAKE_COMPILER_IS_GNUCXX)
  # use default OSF compiler flags
  SET (CMAKE_C_FLAGS_INIT "")
  SET (CMAKE_C_FLAGS_DEBUG_INIT "-g")
  SET (CMAKE_C_FLAGS_MINSIZEREL_INIT "-O2 -DNDEBUG")
  SET (CMAKE_C_FLAGS_RELEASE_INIT "-O2 -DNDEBUG")
  SET (CMAKE_C_FLAGS_RELWITHDEBINFO_INIT "-O2")
  SET (CMAKE_CXX_FLAGS_INIT "")
  SET (CMAKE_CXX_FLAGS_DEBUG_INIT "-g")
  SET (CMAKE_CXX_FLAGS_MINSIZEREL_INIT "-O2 -DNDEBUG")
  SET (CMAKE_CXX_FLAGS_RELEASE_INIT "-O2 -DNDEBUG")
  SET (CMAKE_CXX_FLAGS_RELWITHDEBINFO_INIT "-O2")
ENDIF(CMAKE_COMPILER_IS_GNUCXX)
INCLUDE(Platform/UnixPaths)
