cmake_minimum_required(VERSION 3.20)
project(kakuroTest)

set(CMAKE_CXX_STANDARD 14)


set(CMAKE_CXX_FLAGS_ASAN "-g -fsanitize=address,undefined -fno-sanitize-recover=all"
        CACHE STRING "Compiler flags in asan build"
        FORCE)

add_executable(kakuroTest
        main.cpp
        Board.h
        Board.cpp
        EmptyCell.h
        EmptyCell.cpp
        Generator.h
        Generator.cpp
        InfoCell.h
        InfoCell.cpp
        InputCell.h
        InputCell.cpp
        Block.h
        Block.cpp)
