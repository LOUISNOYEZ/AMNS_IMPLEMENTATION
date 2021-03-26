cmake_minimum_required(VERSION 3.17)
project(GENERATION C)

set(CMAKE_C_STANDARD 99)

set(GMP_DIR "C:/Users/louis/Desktop/gmp")
include_directories(GENERATION ${GMP_DIR}/include)
find_library(GMP_LIBRARY NAMES gmp libgmp PATHS "${GMP_DIR}")
find_package(OpenSSL)
add_executable(GENERATION main.c )
target_link_libraries(GENERATION gmp libgmp crypto)