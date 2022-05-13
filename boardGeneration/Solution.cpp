#include "EmptyCell.h"
#include "InputCell.h"
#include "InfoCell.h"
#include "Solution.h"

bool checkUsedNumbers(const std::vector<int>& usedNumbers) {
    for (int usedNumber : usedNumbers) {
        if (usedNumber > 1) return false;
    }
    return true;
}
void clearVector(std::vector<int>& usedNumbers) {
    for (int usedNumber : usedNumbers) {
        usedNumber = 0;
    }
}

bool solution::checkSolution(Board &board) {
    std::vector<int> usedNumbers = std::vector<int>(9);
    for (int i = 0; i < board.getHeight(); ++i) {
        for (int j = 0; j < board.getWidth(); ++j) {
            if (board.getCellType(i, j) == EmptyCell::Type::TYPE_INFO) {
                // horizontal
                // right
                int horizontalSum = 0, verticalSum = 0;
                for (int k = j; k < board.getWidth(); ++k) {
                    if (k != j) {
                        if (board.getCellType(i, k) == EmptyCell::Type::TYPE_INPUT) {
                            horizontalSum += std::static_pointer_cast<InputCell>(board.getCells()[i][k])->m_actualValue;
                            usedNumbers[std::static_pointer_cast<InputCell>(board.getCells()[i][k])->m_actualValue]++;
                        } else {
                            break;
                        }
                    }
                }
                if ((horizontalSum != std::static_pointer_cast<InfoCell>(board.getCells()[i][j])->m_horizontalSum) ||
                        checkUsedNumbers(usedNumbers)) {
                    return false;
                }
                clearVector(usedNumbers);
                // vertical
                // down
                for (int k = i; k < board.getHeight(); ++k) {
                    if (k != i) {
                        if (board.getCellType(k, j) == EmptyCell::Type::TYPE_INPUT) {
                            verticalSum += std::static_pointer_cast<InputCell>(board.getCells()[k][j])->m_actualValue;
                            usedNumbers[std::static_pointer_cast<InputCell>(board.getCells()[i][k])->m_actualValue]++;
                        } else {
                            break;
                        }
                    }
                }
                if ((verticalSum != std::static_pointer_cast<InfoCell>(board.getCells()[i][j])->m_horizontalSum) ||
                    checkUsedNumbers(usedNumbers)) {
                    return false;
                }
            }
        }
    }
    return true;
}