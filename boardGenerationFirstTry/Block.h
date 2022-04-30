

#ifndef KAKUROTEST_BLOCK_H
#define KAKUROTEST_BLOCK_H

#include "EmptyCell.h"

class Block {
public:
    int m_numberOfCells = -1, m_numberOfHorizontalCells = 0, m_numberOfVerticalCells = 0;
    std::vector<std::shared_ptr<EmptyCell>> m_horizontalCells, m_verticalCells;
    int m_currentRow, m_currentColumn;
    Block(int numberOfCellsH, int numberOfCellsV, int i, int j);
    Block(int i, int j);
    Block();
};
#endif //KAKUROTEST_BLOCK_H
