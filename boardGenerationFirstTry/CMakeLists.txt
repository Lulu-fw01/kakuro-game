cmake_minimum_required(VERSION 3.21)
project(boardGenerationFirstTry)

set(CMAKE_CXX_STANDARD 14)

set(CMAKE_CXX_FLAGS_ASAN "-g -fsanitize=address,undefined -fno-sanitize-recover=all"
        CACHE STRING "Compiler flags in asan build"
        FORCE)

add_executable(
        boardGenerationFirstTry
        main.cpp
        EmptyCell.cpp EmptyCell.h
        InfoCell.cpp InfoCell.h
        InputCell.cpp InputCell.h
        Generator.cpp Generator.h Board.cpp Board.h)
