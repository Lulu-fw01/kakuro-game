#include "Generator.h"
#include <iostream>

int main() {
    auto board = generation::generate(11, 11, generation::DIFFICULTY_MEDIUM);
    Board::print(board);
    std::cout << std::endl << board.toNativeFormat();
    return 0;
}
