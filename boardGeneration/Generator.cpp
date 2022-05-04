#include "Generator.h"
#include "EmptyCell.h"
#include "InputCell.h"
#include "InfoCell.h"


int correctRow(Board& board, int row, int column, bool skipPenultimate);
int correctColumn(Board& board, int row, int column, bool skipPenultimate);

/**
 * @brief generate new kakuro board.
 *
 * */
Board generation::generate(int height, int width, generation::Difficulty difficulty) {
    std::srand(static_cast<unsigned int>(time(nullptr)));
    // Create empty board.
    Board board(height, width);
    createPattern(board, difficulty);
    fillNumbers(board);
    fillSums(board);

    return board;
}

int generation::getRandomNum(int min, int max) {
    return min + rand() % (max - min + 1);
}

int generation::getNext(generation::Difficulty difficulty) {
    return getRandomNum(difficulty, 9);
}

/**
 * @brief method for creating pattern on the board.
 * Pattern it is board filled <p> with EmptyCells, InfoCells and InputCells but without values.
 *
 * @param board kakuro board.
 * */
void generation::createPattern(Board &board, generation::Difficulty difficulty) {
    board.setCell(0, 0, EmptyCell::Type::TYPE_EMPTY);

    // Fill first row with Info cells.
    for (int j = 1; j < board.getWidth(); ++j) {
        board.setCell(0, j, EmptyCell::Type::TYPE_INFO);
    }

    addInfoCells(board, difficulty);
    // TODO later try to add empty cells while add info cells.
    addEmptyCells(board);
}

void generation::fillPenultimateRow(Board &board, int &infoMissedCount, std::set<int> &hSet, generation::Difficulty difficulty) {
    bool infoNext;
    int next;
    int row = board.getHeight() - 2;
    bool valid;
    int infoRowLength = 0;
    for (int j = 1; j < board.getWidth(); j++) {
        infoNext = false;
        valid = board.isValidUpLeftDown(j);
        if (infoMissedCount > 0) {
            if (valid) {
                infoNext = true;
                infoMissedCount--;
            }
        }
        next = getNext(difficulty);
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
            infoRowLength = 0;
        } else {
            infoRowLength++;
            if(infoRowLength == 10) {
                infoRowLength = j - correctRow(board, row, j, false);
            }
        }
    }
}

void generation::fillPenultimateColumn(Board &board, int &infoMissedCount, std::set<int> &hSet, generation::Difficulty difficulty) {
    bool infoNext;
    int next;
    int column = board.getWidth() - 2;
    bool valid;
    int infoColumnLength = 0;
    for (int j = 1; j < board.getHeight(); j++) {
        infoNext = false;
        valid = board.isValidUpLeftRight(j);
        if (infoMissedCount > 0) {
            if (valid) {
                infoNext = true;
                infoMissedCount--;
            }
        }
        next = getNext(difficulty);
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
            infoColumnLength = 0;
        } else {
            infoColumnLength++;
            if (infoColumnLength == 10) {
                infoColumnLength = j - correctColumn(board, j, column, false);
            }
        }
    }
}

int correctColumn(Board& board, int row, int column, bool skipPenultimate) {
    int startRow = row - 9;
    std::vector<int> freePositions;
    for (int i = startRow; i <= row; ++i) {
        if ((i != board.getHeight() - 2 || !skipPenultimate) && board.isLeftValid(i, column) && board.isHigherValid(i, column) && board.isRightValid(i, column) && board.isBelowValid(i, column)) {
            freePositions.push_back(i);
        }
    }

    int ind;
    if (freePositions.empty()) {
        ind = generation::getRandomNum(startRow, row);
    } else {
        ind = freePositions[generation::getRandomNum(0, freePositions.size() - 1)];
    }
    board.setCell(ind, column, EmptyCell::Type::TYPE_INFO);
    return ind;
}

// TODO add penultimate row/column flag.
int correctRow(Board& board, int row, int column, bool skipPenultimate) {
    int startCol = column - 9;
    std::vector<int> freePositions;
    for (int i = startCol; i <= column; ++i) {
        if ((i != board.getWidth() - 2 || !skipPenultimate) && board.isLeftValid(row, i) && board.isHigherValid(row, i) && board.isRightValid(row, i)) {
            freePositions.push_back(i);
        }
    }

    int ind;
    if (freePositions.empty()) {
        ind = generation::getRandomNum(startCol, column);
    } else {
        ind = freePositions[generation::getRandomNum(0, freePositions.size() - 1)];
    }
    board.setCell(row, ind, EmptyCell::Type::TYPE_INFO);
    return ind;
}

/**
 * @brief this function randomly adds InfoCells on kakuro board.
 *
 * @param board kakuro board.
 * */
void generation::addInfoCells(Board &board, generation::Difficulty difficulty) {
    int next;
    int infoMissedCount = 0;
    bool infoNext;
    std::set<int> hSet;
    bool valid;
    int infoRowLength;

    std::vector<int> infoColumnLength(board.getWidth(), 0);
    for (int i = 1; i < board.getHeight(); i++) {
        board.setCell(i, 0, EmptyCell::Type::TYPE_INFO);
        infoRowLength = 0;
        for (int j = 1; j < board.getWidth(); j++) {
            infoNext = false;
            valid = board.isValidUpLeft(i, j);
            if (infoMissedCount > 0) {
                if (valid) {
                    infoNext = true;
                    infoMissedCount--;
                }
            }
            next = getNext(difficulty);
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
            if (infoNext) {
                infoRowLength = 0;
                infoColumnLength[j] = 0;
            } else {
                infoRowLength++;
                infoColumnLength[j]++;
                // TODO skip penultimte row/col.
                if (i != board.getHeight() - 2 && infoRowLength >= 10) {
                    int changedColNum = correctRow(board, i, j, true);
                    infoRowLength = j - changedColNum;
                    infoColumnLength[changedColNum] = 0;
                }
                if (j != board.getWidth() - 2 && infoColumnLength[j] >= 10) {
                    int changedRowNum = correctColumn(board, i, j, true);
                    infoColumnLength[j] = i - changedRowNum;
                    if (infoColumnLength[j] == 0) {
                        infoRowLength = 0;
                    }
                }
            }
        }
    }

    int r = getRandomNum(0, 9);
    if (r % 2 == 0) {
        fillPenultimateRow(board, infoMissedCount, hSet, difficulty);
        fillPenultimateColumn(board, infoMissedCount, hSet, difficulty);
    } else {
        fillPenultimateColumn(board, infoMissedCount, hSet, difficulty);
        fillPenultimateRow(board, infoMissedCount, hSet, difficulty);
    }
}

/**
 * This function change useless InfoCells with EmptyCells.
 * */
void generation::addEmptyCells(Board &board) {
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

/**
 * @brief function to find available numbers to put into cell.
 * @param board kakuro board.
 * @param row index of row.
 * @param column index of column.
 * @return vector with available numbers.
 */
std::vector<int> findAvailableNumbers(Board &board, int row, int column) {
    std::vector<int> availableNumbers;
    for (int k = 0; k < 9; ++k) {
        if (std::static_pointer_cast<InputCell>(board.getCells()[row][column])->m_innerNumbers[k] == 0) {
            availableNumbers.push_back(k);
        }
    }
    return availableNumbers;
}

/**
 * @brief function to set a number into cell and mark it in vectors.
 * @param blocks blocks of cells.
 * @param blockRowIndex row index in blocks of cell the number is put.
 * @param blockColumnIndex column index in blocks of cell the number is put.
 * @param board kakuro board.
 * @param cellRowIndex row index in board of cell the number is put.
 * @param cellColumnIndex column index in board of cell the number is put.
 * @param availableNumbers vector of available numbers.
 */
void chooseNumber(std::vector<std::vector<Block>> &blocks, int blockRowIndex, int blockColumnIndex,
                  Board &board, int cellRowIndex, int cellColumnIndex, std::vector<int> availableNumbers) {
    int randomIndex = generation::getRandomNum(0, availableNumbers.size() - 1);
    int index = availableNumbers[randomIndex];
    std::static_pointer_cast<InputCell>(board.getCells()[cellRowIndex][cellColumnIndex])->m_value = index + 1;
    std::static_pointer_cast<InputCell>(board.getCells()[cellRowIndex][cellColumnIndex])->m_innerNumbers[index] = 1;
    for (int l = 0; l < blocks[blockRowIndex][blockColumnIndex].m_numberOfHorizontalCells; ++l) {
        std::static_pointer_cast<InputCell>(blocks[blockRowIndex][blockColumnIndex].m_horizontalCells[l])->m_outerNumbers[index] = 1;
    }
    for (int l = 0; l < blocks[blockRowIndex][blockColumnIndex].m_numberOfVerticalCells; ++l) {
        std::static_pointer_cast<InputCell>(blocks[blockRowIndex][blockColumnIndex].m_verticalCells[l])->m_outerNumbers[index] = 1;
    }
}

/**
 * @brief function to fill kakuro board with numbers.
 * @param board kakuro board.
 */
void generation::fillNumbers(Board &board) {
    auto blocks = findBlocks(board);
    bool rightFilled = true;
    for (int i = 0; i < board.getHeight(); ++i) {
        for (int j = 0; j < board.getWidth(); ++j) {
            if (blocks[i][j].m_currentRow != -1) {
                if (rightFilled) {
                    int i_iter = blocks[i][j].m_currentRow;
                    int j_iter = blocks[i][j].m_currentColumn;
                    if (std::static_pointer_cast<InputCell>(board.getCells()[i_iter][j_iter])->m_value == 0) {
                        std::static_pointer_cast<InputCell>(board.getCells()[i_iter][j_iter])->m_innerNumbers.assign(
                                std::static_pointer_cast<InputCell>(board.getCells()[i_iter][j_iter])->m_outerNumbers.begin(),
                                std::static_pointer_cast<InputCell>(board.getCells()[i_iter][j_iter])->m_outerNumbers.end());
                    }
                    bool filled = false;
                    std::vector<int> availableNumbers = findAvailableNumbers(board, i_iter, j_iter);
                    if (!availableNumbers.empty()) {
                        chooseNumber(blocks, i, j, board, i_iter, j_iter, availableNumbers);
                        filled = true;
                    }
                    if (!filled) {
                        std::static_pointer_cast<InputCell>(board.getCells()[i_iter][j_iter])->m_value = 0;
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
                    int temp_value = std::static_pointer_cast<InputCell>(board.getCells()[i_iter][j_iter])->m_value - 1;
                    for (int l = 0; l < blocks[i][j].m_numberOfHorizontalCells; ++l) {
                        // TODO sometimes error here.
                        std::static_pointer_cast<InputCell>(blocks[i][j].m_horizontalCells[l])->m_outerNumbers[temp_value] = 0;
                    }
                    for (int l = 0; l < blocks[i][j].m_numberOfVerticalCells; ++l) {
                        std::static_pointer_cast<InputCell>(blocks[i][j].m_verticalCells[l])->m_outerNumbers[temp_value] = 0;
                    }
                    std::static_pointer_cast<InputCell>(board.getCells()[i_iter][j_iter])->m_innerNumbers[temp_value] = 1;

                    bool filled = false;
                    std::vector<int> availableNumbers = findAvailableNumbers(board, i_iter, j_iter);
                    if (!availableNumbers.empty()) {
                        chooseNumber(blocks, i, j, board, i_iter, j_iter, availableNumbers);
                        filled = true;
                    }
                    if (!filled) {
                        std::static_pointer_cast<InputCell>(board.getCells()[i_iter][j_iter])->m_value = 0;
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

/**
 * @brief function to fill kakuro board with sums in info cells.
 * @param board kakuro board.
 */
void generation::fillSums(Board &board) {
    for (int i = 0; i < board.getWidth(); ++i) {
        for (int j = 0; j < board.getHeight(); ++j) {
            if (board.getCellType(i, j) == EmptyCell::Type::TYPE_INFO) {
                // horizontal
                // right
                int horizontalSum = 0, verticalSum = 0;
                for (int k = j; k < board.getHeight(); ++k) {
                    if (k != j) {
                        if (board.getCellType(i, k) == EmptyCell::Type::TYPE_INPUT) {
                            horizontalSum += std::static_pointer_cast<InputCell>(board.getCells()[i][k])->m_value;
                        } else {
                            break;
                        }
                    }
                }
                // vertical
                // down
                for (int k = i; k < board.getWidth(); ++k) {
                    if (k != i) {
                        if (board.getCellType(k, j) == EmptyCell::Type::TYPE_INPUT) {
                            verticalSum += std::static_pointer_cast<InputCell>(board.getCells()[k][j])->m_value;
                        } else {
                            break;
                        }
                    }
                }
                std::static_pointer_cast<InfoCell>(board.getCells()[i][j])->m_horizontalSum = horizontalSum;
                std::static_pointer_cast<InfoCell>(board.getCells()[i][j])->m_verticalSum = verticalSum;
            }
        }
    }
}

/**
 * @brief function to find cells in the same row block as the given one.
 * @param block block for the given cell.
 * @param board kakuro board.
 * @param rowIndex index of row.
 * @param columnNumber index of column.
 */
void findHorizontalCells(Block &block, Board &board, int rowIndex, int columnNumber) {
    // horizontal
    // right
    for (int k = columnNumber; k < board.getWidth(); ++k) {
        if (board.getCellType(rowIndex, k) != EmptyCell::Type::TYPE_INPUT) {
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
        if (board.getCellType(rowIndex, k) != EmptyCell::Type::TYPE_INPUT) {
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

/**
 * @brief function to find cells in the same column block as the given one.
 * @param block block for the given cell.
 * @param board kakuro board.
 * @param rowIndex index of row.
 * @param columnNumber index of column.
 */
void findVerticalCells(Block &block, Board &board, int rowIndex, int columnNumber) {
    // vertical
    // down
    for (int k = rowIndex; k < board.getHeight(); ++k) {
        if (board.getCellType(k, columnNumber) != EmptyCell::Type::TYPE_INPUT) {
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
        if (board.getCellType(k, columnNumber) != EmptyCell::Type::TYPE_INPUT) {
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

/**
 * @brief function to find cells in the same blocks as another cell.
 * @param board kakuro board.
 * @return vector of blocks.
 */
std::vector<std::vector<Block>> generation::findBlocks(Board &board) {
    std::vector<std::vector<Block>> blocks(board.getHeight());
    for (int i = 0; i < board.getHeight(); ++i) {
        blocks[i] = std::vector<Block>(board.getWidth());
    }
    for (int i = 0; i < board.getHeight(); ++i) {
        for (int j = 0; j < board.getWidth(); ++j) {
            if (board.getCellType(i, j) == EmptyCell::Type::TYPE_INPUT) {
                Block block = Block(i, j);
                findHorizontalCells(block, board, i, j);
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