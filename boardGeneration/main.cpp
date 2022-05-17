#include "Generator.h"
#include "Solution.h"
#include <iostream>

int main() {
    /*auto board = generation::generate(5, 5, generation::DIFFICULTY_MEDIUM);
    Board::print(board);
    std::cout << std::endl << board.toNativeFormat();*/

    //std::string nBoard2 = R"(emp inf#16\0 inf#15\0 emp emp inf#0\13 inp#8\5 inp#5\4 inf#23\0 emp inf#0\16 inp#7\6 inp#3\7 inp#6\3 inf#12\0 inf#0\20 inp#1\1 inp#7\3 inp#8\4 inp#4\5 emp emp inf#0\17 inp#9\7 inp#8\1)";
    /*auto brd = Board::boardFromNativeFormat(5, 5, nBoard);
    Board::print(brd);
    std::cout << solution::checkSolution(brd) <<std::endl;*/

    //std::string nBoard2 = R"(emp inf#16\0 inf#15\0 emp emp inf#0\13 inp#8\8 inp#5\5 inf#23\0 emp inf#0\16 inp#7\7 inp#3\3 inp#6\6 inf#12\0 inf#0\20 inp#1\1 inp#7\7 inp#8\8 inp#4\4 emp emp inf#0\17 inp#9\9 inp#8\8)";

    //std::string nBoard2 = R"(emp inf#13\0 inf#11\0 inf#0\12 inp#5\5 inp#7\7 inf#0\12 inp#8\8 inp#4\4)";
    std::string nBoard2 = R"(emp inf#13\0 inf#11\0 inf#0\12 inp#5\8 inp#7\4 inf#0\12 inp#8\5 inp#4\7)";
    auto brd2 = Board::boardFromNativeFormat(3, 3, nBoard2);
    Board::print(brd2);
    std::cout << solution::checkSolution(brd2) << std::endl;

    return 0;
}
