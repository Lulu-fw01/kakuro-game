cmake_minimum_required(VERSION 3.21)
project(boardGenerationFirstTry)

set(CMAKE_CXX_STANDARD 14)

add_executable(
        boardGenerationFirstTry
        main.cpp
        EmptyCell.cpp EmptyCell.h
        InfoCell.cpp InfoCell.h
        InputCell.cpp InputCell.h
        Generator.cpp Generator.h)
