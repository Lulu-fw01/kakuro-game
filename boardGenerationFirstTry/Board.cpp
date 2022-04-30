#include <iostream>
#include "Board.h"
#include "InfoCell.h"
#include "InputCell.h"
#include "Block.h"

/**
 * @brief Constructor.
 *
 * @param height height of the field (number of rows).
 * @param width width of the field (number of columns).
 * */
Board::Board(int height, int width) {
    m_height = height;
    m_width = width;
    m_cells = std::vector<std::vector<std::shared_ptr<EmptyCell> >>(height,
                                                                    std::vector<std::shared_ptr<EmptyCell>>(width,
                                                                                                            std::shared_ptr<EmptyCell>()));
}

std::vector<std::vector<std::shared_ptr<EmptyCell>>> Board::getCells() {
    return m_cells;
}

/**
 * @brief Height of the board.
 * */
int Board::getHeight() const {
    return m_height;
}

/**
 * @brief Width of the board
 * */
int Board::getWidth() const {
    return m_width;
}

bool Board::checkUpLeft(int row, int column) const {
    int lefter = column - 2;
    if (lefter >= 0) {
        int prevL = column - 1;
        if (m_cells[row][lefter]->getType() == EmptyCell::Type::TYPE_INFO &&
            m_cells[row][prevL]->getType() == EmptyCell::Type::TYPE_INPUT) {
            return false;
        }
    }

    int higher = row - 2;
    if (higher >= 0) {
        int prevH = row - 1;
        if (m_cells[higher][column]->getType() == EmptyCell::Type::TYPE_INFO &&
            m_cells[prevH][column]->getType() == EmptyCell::Type::TYPE_INPUT) {
            return false;
        }
    }
    return true;
}

/**
 * @brief Check if info cell can be placed here.
 * It checks cells lefter and higher than cell[row, column]
 *
 * @attention for every cell in penultimate Row orColumn answer will be false.
 *
 * @param row row number.
 * @param column column number.
 * */
bool Board::isValidUpLeft(int row, int column) const {
    if (row == m_height - 2 || column == m_width - 2) {
        return false;
    }

    return checkUpLeft(row, column);
}

/**
 * @brief Check if info cell can be placed here.
 *
 * @attention Method for checking cells in penultimate Row.
 *
 * @param column column number.
 * */
bool Board::isValidUpLeftDown(int column) const {
    return (getCellType(m_height - 1, column) == EmptyCell::Type::TYPE_INFO) && checkUpLeft(m_height - 2, column);
}

/**
 * @brief Check if info cell can be placed here.
 * It checks cells lefter and higher than cell[row, column].
 * @attention Method for checking cells in penultimate Column.
 *
 * @param row row number.
 * */
bool Board::isValidUpLeftRight(int row) const {
    return (getCellType(row, m_width - 1) == EmptyCell::Type::TYPE_INFO) && checkUpLeft(row, m_width - 2);
}

/**
 * @brief Set cell type.
 *
 * @param row row number.
 * @param column column number.
 * @param type type of the cell.
 * */
void Board::setCell(int row, int column, EmptyCell::Type type) {
    std::shared_ptr<EmptyCell> ptr;
    switch (type) {
        case EmptyCell::Type::TYPE_EMPTY:
            ptr = std::make_shared<EmptyCell>();
            break;
        case EmptyCell::TYPE_INFO:
            ptr = std::make_shared<InfoCell>();
            break;
        case EmptyCell::TYPE_INPUT:
            ptr = std::make_shared<InputCell>();
            break;
    }
    m_cells[row][column] = ptr;
}

/**
 * @brief Print board in console.
 * */
void Board::print(const Board &board) {
    for (const auto &i: board.m_cells) {
        for (const auto &j: i) {
            if (j->getType() == EmptyCell::Type::TYPE_INFO) {
                std::cout << "\033[31m" << j->getCellStr() << "\033[0m ";
            } else {
                std::cout << j->getCellStr() << " ";
            }
        }
        std::cout << std::endl;
    }
    std::cout << std::endl;

}

/**
 * @brief Type of cell in board.
 *
 * @param row row number.
 * @param column column number.
 * */
EmptyCell::Type Board::getCellType(int row, int column) const {
    return m_cells[row][column]->getType();
}

void Board::setIndexes() {
    for (int i = 0; i < m_height; ++i) {
        for (int j = 0; j < m_width; ++j) {
            m_cells[i][j]->m_rowNumber = i;
            m_cells[i][j]->m_columnNumber = j;
        }
    }
}



/*std::vector<std::vector<Block>> Board::findBlocks() {
    std::vector<std::vector<Block>> numbers(m_height);
    for (int i = 0; i < m_height; ++i) {
        numbers[i] = std::vector<Block>(m_width);
    }
    for (int i = 0; i < m_height; ++i) {
        for (int j = 0; j < m_width; ++j) {
            if (m_cells[i][j]->getType() == EmptyCell::Type::TYPE_INPUT) {
                Block block = Block(i, j);
                // horizontal
                // right
                for (int k = j; k < m_width; ++k) {
                    if (m_cells[i][k]->getType() != EmptyCell::Type::TYPE_INPUT) {
                        break;
                    } else {
                        if (k != j) {
                            block.m_numberOfCells++;
                            block.m_numberOfHorizontalCells++;
                            block.m_horizontalCells.push_back(m_cells[i][k]);
                        }
                    }
                }
                // left
                for (int k = j; k >= 0; --k) {
                    if (m_cells[i][k]->getType() != EmptyCell::Type::TYPE_INPUT) {
                        break;
                    } else {
                        if (k != j) {
                            block.m_numberOfCells++;
                            block.m_numberOfHorizontalCells++;
                            block.m_horizontalCells.push_back(m_cells[i][k]);
                        }
                    }
                }
                // vertical
                // down
                for (int k = i; k < m_height; ++k) {
                    if (m_cells[k][j]->getType() != EmptyCell::Type::TYPE_INPUT) {
                        break;
                    } else {
                        if (k != i) {
                            block.m_numberOfCells++;
                            block.m_numberOfVerticalCells++;
                            block.m_verticalCells.push_back(m_cells[k][j]);
                        }
                    }
                }
                // up
                for (int k = i; k >= 0; --k) {
                    if (m_cells[k][j]->getType() != EmptyCell::Type::TYPE_INPUT) {
                        break;
                    } else {
                        if (k != i) {
                            block.m_numberOfCells++;
                            block.m_numberOfVerticalCells++;
                            block.m_verticalCells.push_back(m_cells[k][j]);
                        }
                    }
                }
                numbers[i][j] = block;
            }
            else {
                numbers[i][j].m_currentRow = -1;
            }
        }
    }
    return numbers;
}*/