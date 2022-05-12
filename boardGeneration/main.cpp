#include "Generator.h"
#include <iostream>

int main() {
    /*auto board = generation::generate(5, 5, generation::DIFFICULTY_MEDIUM);
    Board::print(board);
    std::cout << std::endl << board.toNativeFormat();*/

    std::string nBoard = R"(emp inf#16\0 inf#15\0 emp emp inf#0\13 inp#8\5 inp#5\4 inf#23\0 emp inf#0\16 inp#7\6 inp#3\7 inp#6\3 inf#12\0 inf#0\20 inp#1\1 inp#7\3 inp#8\4 inp#4\5 emp emp inf#0\17 inp#9\7 inp#8\1)";
    auto brd = Board::boardFromNativeFormat(5, 5, nBoard);
    Board::print(brd);
    return 0;
}
