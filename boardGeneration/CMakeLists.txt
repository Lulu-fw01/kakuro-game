cmake_minimum_required(VERSION 3.20)
project(boardGenerationFirstTry)

set(CMAKE_CXX_STANDARD 14)


set(CMAKE_CXX_FLAGS_ASAN "-g -fsanitize=address,undefined -fno-sanitize-recover=all"
        CACHE STRING "Compiler flags in asan build"
        FORCE)

add_executable(boardGeneration
        main.cpp
        Board.h
        Board.cpp
        EmptyCell.h
        EmptyCell.cpp
        Generator.h
        Generator.cpp
        Solution.h
        Solution.cpp
        InfoCell.h
        InfoCell.cpp
        InputCell.h
        InputCell.cpp
        Block.h
        Block.cpp)