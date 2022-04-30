cmake_minimum_required(VERSION 3.10)
project(api LANGUAGES CXX C)

add_library(kakuro_native_api
  SHARED
  ./kakuroApi.cpp
)