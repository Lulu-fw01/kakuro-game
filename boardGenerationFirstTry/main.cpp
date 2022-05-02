#include "Generator.h"
#include <iostream>

int main() {
    auto board = generation::generate(10, 10, generation::DIFFICULTY_MEDIUM);
    Board::print(board);
    std::cout << std::endl << board.toNativeFormat();
    return 0;
}
