

#include <vector>
#include <algorithm>
#include "Generator.h"
#include "InputCell.h"
#include "Block.h"

Block::Block(int numberOfCellsH, int numberOfCellsV, int i, int j) {
    this->m_numberOfHorizontalCells = numberOfCellsH;
    this->m_numberOfVerticalCells = numberOfCellsV;
    m_horizontalCells = std::vector<std::shared_ptr<EmptyCell>>(numberOfCellsH);
    m_verticalCells = std::vector<std::shared_ptr<EmptyCell>>(numberOfCellsV);
    m_currentRow = i;
    m_currentColumn = j;
}
Block::Block(int i, int j) {
    m_currentRow = i;
    m_currentColumn = j;
    this->m_numberOfHorizontalCells = 0;
    this->m_numberOfVerticalCells = 0;
}
Block::Block() {
    m_currentRow = -1;
}

