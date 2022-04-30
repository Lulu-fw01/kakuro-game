#include "Generator.h"
#include "EmptyCell.h"
#include "InputCell.h"
#include "InfoCell.h"

/**
 * @brief generate new kakuro board.
 *
 * */
Board Generator::generate(int height, int width, int difficulty) {
    std::srand(static_cast<unsigned int>(time(nullptr)));
    // TODO add difficulty.
    // Create empty board.
    Board board(height, width);
    createPattern(board);
    fillNumbers(board);
    fillSums(board);

    return board;
}

/**
 * @brief Temporary method for generating and printing board.
 * */
void Generator::generateAndPrint() {
    auto board = generate(10, 10, 1);

    Board::print(board);
}

int Generator::getRandomNum(int min, int max) {
    return min + rand() % (max - min + 1);
}

int Generator::getNext() {
    // TODO add difficulty.
    return getRandomNum(3, 9);
}

/**
 * @brief method for creating pattern on the board.
 * Pattern it is board filled <p> with EmptyCells, InfoCells and InputCells but without values.
 *
 * @param board kakuro board.
 * */
void Generator::createPattern(Board &board) {
    board.setCell(0, 0, EmptyCell::Type::TYPE_EMPTY);

    // Fill first row with Info cells.
    for (int i = 1; i < board.getHeight(); ++i) {
        board.setCell(i, 0, EmptyCell::Type::TYPE_INFO);
    }

    // Fill first column with Info cells.
    for (int j = 1; j < board.getWidth(); ++j) {
        board.setCell(0, j, EmptyCell::Type::TYPE_INFO);
    }

    addInfoCells(board);
    // TODO try to add empty cells while add info cells.
    addEmptyCells(board);
}

void Generator::fillPenultimateRow(Board &board, int &infoMissedCount, std::set<int> &hSet) {
    bool infoNext;
    int next;
    int row = board.getHeight() - 2;
    bool valid;
    for (int j = 1; j < board.getWidth(); j++) {
        infoNext = false;
        valid = board.isValidUpLeftDown(j);
        if (infoMissedCount > 0) {
            if (valid) {
                infoNext = true;
                infoMissedCount--;
            }
        }
        next = getNext();
        if (hSet.find(next) == hSet.end()) {
            hSet.insert(next);
        } else {
            if (valid) {
                if (infoNext) {
                    infoMissedCount++;
                }
                infoNext = true;
            } else {
                infoMissedCount++;
            }
            hSet.clear();
        }

        if (infoNext) {
            board.setCell(row, j, EmptyCell::Type::TYPE_INFO);
        }
    }
}

void Generator::fillPenultimateColumn(Board &board, int &infoMissedCount, std::set<int> &hSet) {
    bool infoNext;
    int next;
    int column = board.getWidth() - 2;
    bool valid;
    for (int j = 1; j < board.getHeight(); j++) {
        infoNext = false;
        valid = board.isValidUpLeftRight(j);
        if (infoMissedCount > 0) {
            if (valid) {
                infoNext = true;
                infoMissedCount--;
            }
        }
        next = getNext();
        if (hSet.find(next) == hSet.end()) {
            hSet.insert(next);
        } else {
            if (valid) {
                if (infoNext) {
                    infoMissedCount++;
                }
                infoNext = true;
            } else {
                infoMissedCount++;
            }
            hSet.clear();
        }

        if (infoNext) {
            board.setCell(j, column, EmptyCell::Type::TYPE_INFO);
        }
    }
}

/**
 * @brief this function randomly adds InfoCells on kakuro board.
 *
 * @param board kakuro board.
 * */
void Generator::addInfoCells(Board &board) {
    int next;
    int infoMissedCount = 0;
    bool infoNext;
    std::set<int> hSet;
    bool valid;
    for (int i = 1; i < board.getHeight(); i++) {
        for (int j = 1; j < board.getWidth(); j++) {
            infoNext = false;
            valid = board.isValidUpLeft(i, j);
            if (infoMissedCount > 0) {
                if (valid) {
                    infoNext = true;
                    infoMissedCount--;
                }
            }
            next = getNext();
            if (hSet.find(next) == hSet.end()) {
                hSet.insert(next);
            } else {
                if (valid) {
                    if (infoNext) {
                        infoMissedCount++;
                    }
                    infoNext = true;
                } else {
                    infoMissedCount++;
                }
                hSet.clear();
            }

            board.setCell(i, j, infoNext ? EmptyCell::Type::TYPE_INFO : EmptyCell::Type::TYPE_INPUT);
        }
    }

    int r = getRandomNum(0, 9);
    if (r % 2 == 0) {
        fillPenultimateRow(board, infoMissedCount, hSet);
        fillPenultimateColumn(board, infoMissedCount, hSet);
    } else {
        fillPenultimateColumn(board, infoMissedCount, hSet);
        fillPenultimateRow(board, infoMissedCount, hSet);
    }
}

/**
 * This function change useless InfoCells with EmptyCells.
 * */
void Generator::addEmptyCells(Board &board) {
    int down, right;
    for (int i = 0; i < board.getHeight(); i++) {
        for (int j = 0; j < board.getWidth(); j++) {
            down = i + 1;
            right = j + 1;
            if (i == board.getHeight() - 1 && j == board.getWidth() - 1) {
                if (board.getCellType(i, j) == EmptyCell::Type::TYPE_INFO) {
                    board.setCell(i, j, EmptyCell::Type::TYPE_EMPTY);
                }
                continue;
            }
            if (i == board.getHeight() - 1) {
                if (board.getCellType(i, j) == EmptyCell::Type::TYPE_INFO &&
                    board.getCellType(i, right) != EmptyCell::Type::TYPE_INPUT) {
                    board.setCell(i, j, EmptyCell::Type::TYPE_EMPTY);
                }
                continue;
            }
            if (j == board.getWidth() - 1) {
                if (board.getCellType(i, j) == EmptyCell::Type::TYPE_INFO &&
                    board.getCellType(down, j) != EmptyCell::Type::TYPE_INPUT) {
                    board.setCell(i, j, EmptyCell::Type::TYPE_EMPTY);
                }
                continue;
            }
            if (board.getCellType(i, j) == EmptyCell::Type::TYPE_INFO &&
                board.getCellType(down, j) != EmptyCell::Type::TYPE_INPUT &&
                board.getCellType(i, right) != EmptyCell::Type::TYPE_INPUT) {
                board.setCell(i, j, EmptyCell::Type::TYPE_EMPTY);
            }
        }
    }


}

std::vector<int> findAvailableNumbers(Board &board, int row, int column) {
    std::vector<int> availableNumbers;
    for (int k = 0; k < 9; ++k) {
        if (std::static_pointer_cast<InputCell>(board.getCells()[row][column])->innerNumbers[k] == 0) {
            availableNumbers.push_back(k);
        }
    }
    return availableNumbers;
}

void chooseNumber(std::vector<std::vector<Block>> &blocks, int blockRowIndex, int blockColumnIndex,
                  Board &board, int cellRowIndex, int cellColumnIndex, std::vector<int> availableNumbers) {
    int random_index = Generator::getRandomNum(0, availableNumbers.size() - 1);
    int index = availableNumbers[random_index];
    std::static_pointer_cast<InputCell>(board.getCells()[cellRowIndex][cellColumnIndex])->value = index + 1;
    std::static_pointer_cast<InputCell>(board.getCells()[cellRowIndex][cellColumnIndex])->innerNumbers[index] = 1;
    for (int l = 0; l < blocks[blockRowIndex][blockColumnIndex].m_numberOfHorizontalCells; ++l) {
        std::static_pointer_cast<InputCell>(blocks[blockRowIndex][blockColumnIndex].m_horizontalCells[l])->outerNumbers[index] = 1;
    }
    for (int l = 0; l < blocks[blockRowIndex][blockColumnIndex].m_numberOfVerticalCells; ++l) {
        std::static_pointer_cast<InputCell>(blocks[blockRowIndex][blockColumnIndex].m_verticalCells[l])->outerNumbers[index] = 1;
    }
}

void Generator::fillNumbers(Board &board) {
    auto blocks = findBlocks(board);
    bool rightFilled = true;
    for (int i = 0; i < board.getHeight(); ++i) {
        for (int j = 0; j < board.getWidth(); ++j) {
            if (blocks[i][j].m_currentRow != -1) {
                if (rightFilled) {
                    int i_iter = blocks[i][j].m_currentRow;
                    int j_iter = blocks[i][j].m_currentColumn;
                    if (std::static_pointer_cast<InputCell>(board.getCells()[i_iter][j_iter])->value == 0) {
                        std::static_pointer_cast<InputCell>(board.getCells()[i_iter][j_iter])->innerNumbers.assign(
                                std::static_pointer_cast<InputCell>(board.getCells()[i_iter][j_iter])->outerNumbers.begin(),
                                std::static_pointer_cast<InputCell>(board.getCells()[i_iter][j_iter])->outerNumbers.end());
                    }
                    bool filled = false;
                    std::vector<int> availableNumbers = findAvailableNumbers(board, i_iter, j_iter);
                    /*for (int k = 0; k < 9; ++k) {
                        if (std::static_pointer_cast<InputCell>(board.getCells()[i_iter][j_iter])->innerNumbers[k] == 0) {
                            availableNumbers.push_back(k);
                        }
                    }*/
                    if (!availableNumbers.empty()) {
                        /*int random_index = getRandomNum(0, availableNumbers.size() - 1);
                        int index = availableNumbers[random_index];
                        std::static_pointer_cast<InputCell>(board.getCells()[i_iter][j_iter])->value = index + 1;
                        std::static_pointer_cast<InputCell>(board.getCells()[i_iter][j_iter])->innerNumbers[index] = 1;
                        for (int l = 0; l < blocks[i][j].m_numberOfHorizontalCells; ++l) {
                            std::static_pointer_cast<InputCell>(blocks[i][j].m_horizontalCells[l])->outerNumbers[index] = 1;
                        }
                        for (int l = 0; l < blocks[i][j].m_numberOfVerticalCells; ++l) {
                            std::static_pointer_cast<InputCell>(blocks[i][j].m_verticalCells[l])->outerNumbers[index] = 1;
                        }*/
                        chooseNumber(blocks, i, j, board, i_iter, j_iter, availableNumbers);
                        filled = true;
                    }
                    if (!filled) {
                        std::static_pointer_cast<InputCell>(board.getCells()[i_iter][j_iter])->value = 0;
                        rightFilled = false;
                        if (j == 0) {
                            i--;
                            j = board.getWidth() - 1;
                        } else {
                            j--;
                        }
                    } else {
                        rightFilled = true;
                    }
                } else {
                    int i_iter = blocks[i][j].m_currentRow;
                    int j_iter = blocks[i][j].m_currentColumn;
                    int temp_value = std::static_pointer_cast<InputCell>(board.getCells()[i_iter][j_iter])->value - 1;
                    for (int l = 0; l < blocks[i][j].m_numberOfHorizontalCells; ++l) {
                        std::static_pointer_cast<InputCell>(blocks[i][j].m_horizontalCells[l])->outerNumbers[temp_value] = 0;
                    }
                    for (int l = 0; l < blocks[i][j].m_numberOfVerticalCells; ++l) {
                        std::static_pointer_cast<InputCell>(blocks[i][j].m_verticalCells[l])->outerNumbers[temp_value] = 0;
                    }
                    std::static_pointer_cast<InputCell>(board.getCells()[i_iter][j_iter])->innerNumbers[temp_value] = 1;

                    bool filled = false;
                    std::vector<int> availableNumbers = findAvailableNumbers(board, i_iter, j_iter);
                    /*for (int k = 0; k < 9; ++k) {
                        if (std::static_pointer_cast<InputCell>(board.getCells()[i_iter][j_iter])->innerNumbers[k] == 0) {
                            availableNumbers.push_back(k);
                        }
                    }*/

                    if (!availableNumbers.empty()) {
                        /*int random_index = getRandomNum(0, availableNumbers.size() - 1);
                        int index = availableNumbers[random_index];
                        std::static_pointer_cast<InputCell>(board.getCells()[i_iter][j_iter])->value = index + 1;
                        std::static_pointer_cast<InputCell>(board.getCells()[i_iter][j_iter])->innerNumbers[index] = 1;
                        for (int l = 0; l < blocks[i][j].m_numberOfHorizontalCells; ++l) {
                            std::static_pointer_cast<InputCell>(blocks[i][j].m_horizontalCells[l])->outerNumbers[index] = 1;
                        }
                        for (int l = 0; l < blocks[i][j].m_numberOfVerticalCells; ++l) {
                            std::static_pointer_cast<InputCell>(blocks[i][j].m_verticalCells[l])->outerNumbers[index] = 1;
                        }*/
                        chooseNumber(blocks, i, j, board, i_iter, j_iter, availableNumbers);
                        filled = true;
                    }
                    if (!filled) {
                        std::static_pointer_cast<InputCell>(board.getCells()[i_iter][j_iter])->value = 0;
                        rightFilled = false;
                        if (j == 0) {
                            i--;
                            j = board.getWidth() - 1;
                        } else {
                            j--;
                        }
                    } else {
                        rightFilled = true;
                    }
                }
            }
        }
    }
}

void Generator::fillSums(Board &board) {
    for (int i = 0; i < board.getWidth(); ++i) {
        for (int j = 0; j < board.getHeight(); ++j) {
            if (board.getCells()[i][j]->getType() == EmptyCell::Type::TYPE_INFO) {
                // horizontal
                // right
                int horizontalSum = 0, verticalSum = 0;
                for (int k = j; k < board.getHeight(); ++k) {
                    if (k != j) {
                        if (board.getCells()[i][k]->getType() == EmptyCell::Type::TYPE_INPUT) {
                            horizontalSum += std::static_pointer_cast<InputCell>(board.getCells()[i][k])->value;
                        } else {
                            break;
                        }
                    }
                }
                // vertical
                // down
                for (int k = i; k < board.getWidth(); ++k) {
                    if (k != i) {
                        if (board.getCells()[k][j]->getType() == EmptyCell::Type::TYPE_INPUT) {
                            verticalSum += std::static_pointer_cast<InputCell>(board.getCells()[k][j])->value;
                        } else {
                            break;
                        }
                    }
                }
                std::static_pointer_cast<InfoCell>(board.getCells()[i][j])->horizontalSum = horizontalSum;
                std::static_pointer_cast<InfoCell>(board.getCells()[i][j])->verticalSum = verticalSum;
            }
        }
    }
}

void findHorizontalCells(Block &block, Board &board, int rowIndex, int columnNumber) {
    // horizontal
    // right
    for (int k = columnNumber; k < board.getWidth(); ++k) {
        if (board.getCells()[rowIndex][k]->getType() != EmptyCell::Type::TYPE_INPUT) {
            break;
        } else {
            if (k != columnNumber) {
                block.m_numberOfCells++;
                block.m_numberOfHorizontalCells++;
                block.m_horizontalCells.push_back(board.getCells()[rowIndex][k]);
            }
        }
    }
    // left
    for (int k = columnNumber; k >= 0; --k) {
        if (board.getCells()[rowIndex][k]->getType() != EmptyCell::Type::TYPE_INPUT) {
            break;
        } else {
            if (k != columnNumber) {
                block.m_numberOfCells++;
                block.m_numberOfHorizontalCells++;
                block.m_horizontalCells.push_back(board.getCells()[rowIndex][k]);
            }
        }
    }
}

void findVerticalCells(Block &block, Board &board, int rowIndex, int columnNumber) {
    // vertical
    // down
    for (int k = rowIndex; k < board.getHeight(); ++k) {
        if (board.getCells()[k][columnNumber]->getType() != EmptyCell::Type::TYPE_INPUT) {
            break;
        } else {
            if (k != rowIndex) {
                block.m_numberOfCells++;
                block.m_numberOfVerticalCells++;
                block.m_verticalCells.push_back(board.getCells()[k][columnNumber]);
            }
        }
    }
    // up
    for (int k = rowIndex; k >= 0; --k) {
        if (board.getCells()[k][columnNumber]->getType() != EmptyCell::Type::TYPE_INPUT) {
            break;
        } else {
            if (k != rowIndex) {
                block.m_numberOfCells++;
                block.m_numberOfVerticalCells++;
                block.m_verticalCells.push_back(board.getCells()[k][columnNumber]);
            }
        }
    }
}

std::vector<std::vector<Block>> Generator::findBlocks(Board &board) {
    std::vector<std::vector<Block>> blocks(board.getHeight());
    for (int i = 0; i < board.getHeight(); ++i) {
        blocks[i] = std::vector<Block>(board.getWidth());
    }
    for (int i = 0; i < board.getHeight(); ++i) {
        for (int j = 0; j < board.getWidth(); ++j) {
            if (board.getCells()[i][j]->getType() == EmptyCell::Type::TYPE_INPUT) {
                Block block = Block(i, j);
                // horizontal
                // right
                /*for (int k = j; k < board.getWidth(); ++k) {
                    if (board.getCells()[i][k]->getType() != EmptyCell::Type::TYPE_INPUT) {
                        break;
                    } else {
                        if (k != j) {
                            block.m_numberOfCells++;
                            block.m_numberOfHorizontalCells++;
                            block.m_horizontalCells.push_back(board.getCells()[i][k]);
                        }
                    }
                }
                // left
                for (int k = j; k >= 0; --k) {
                    if (board.getCells()[i][k]->getType() != EmptyCell::Type::TYPE_INPUT) {
                        break;
                    } else {
                        if (k != j) {
                            block.m_numberOfCells++;
                            block.m_numberOfHorizontalCells++;
                            block.m_horizontalCells.push_back(board.getCells()[i][k]);
                        }
                    }
                }*/
                findHorizontalCells(block, board, i, j);
                // vertical
                // down
                /*for (int k = i; k < board.getHeight(); ++k) {
                    if (board.getCells()[k][j]->getType() != EmptyCell::Type::TYPE_INPUT) {
                        break;
                    } else {
                        if (k != i) {
                            block.m_numberOfCells++;
                            block.m_numberOfVerticalCells++;
                            block.m_verticalCells.push_back(board.getCells()[k][j]);
                        }
                    }
                }
                // up
                for (int k = i; k >= 0; --k) {
                    if (board.getCells()[k][j]->getType() != EmptyCell::Type::TYPE_INPUT) {
                        break;
                    } else {
                        if (k != i) {
                            block.m_numberOfCells++;
                            block.m_numberOfVerticalCells++;
                            block.m_verticalCells.push_back(board.getCells()[k][j]);
                        }
                    }
                }*/
                findVerticalCells(block, board, i, j);
                blocks[i][j] = block;
            }
            else {
                blocks[i][j].m_currentRow = -1;
            }
        }
    }
    return blocks;
}
