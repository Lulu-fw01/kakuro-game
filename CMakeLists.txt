cmake_minimum_required(VERSION 3.20)
project(kakuroTest)

set(CMAKE_CXX_STANDARD 14)

add_executable(kakuroTest main.cpp Board.h Board.cpp EmptyCell.h EmptyCell.cpp Generator.h Generator.cpp InfoCell.h InfoCell.cpp InputCell.h InputCell.cpp Block.h Block.cpp)
