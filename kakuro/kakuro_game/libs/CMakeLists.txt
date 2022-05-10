cmake_minimum_required(VERSION 3.10)
project(api LANGUAGES CXX C)

add_library(kakuro_native_api
        SHARED
        kakuroApi.cpp
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