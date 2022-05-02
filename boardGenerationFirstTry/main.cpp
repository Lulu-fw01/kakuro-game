#include "Generator.h"


int main() {
    auto board = generation::generate(10, 10, generation::DIFFICULTY_MEDIUM);
    Board::print(board);
    return 0;
}
