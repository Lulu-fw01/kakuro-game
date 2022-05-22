#define EXPORT extern "C" __attribute__((visibility("default"))) __attribute__((used))

#include <cstring>
#include <string>
#include <iostream>
#include <ctype.h>

#include "Generator.h"
#include "Board.h"
#include "Solution.h"

EXPORT
char* generateBoard(int height, int width, int difficulty) {
    auto board = generation::generate(height, width, static_cast<generation::Difficulty>(difficulty));
    std::string strBoard = board.toNativeFormat();

    char *cstr = new char[strBoard.length() + 1];
    strcpy(cstr, strBoard.c_str());

    return cstr;
}

EXPORT
bool checkSolution(int height, int width, char* board) {
    std::string str(board);
    Board brd = Board::boardFromNativeFormat(height, width, str);
    return solution::checkSolution(brd);
}
