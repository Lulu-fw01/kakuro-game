
#include <algorithm>
#include "Generator.h"


int main() {
    auto board = Generator::generate(10, 10, 1);
    Board::print(board);
    return 0;
}
