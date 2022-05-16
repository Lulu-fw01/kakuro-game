#include "EmptyCell.h"
#include "InputCell.h"
#include "InfoCell.h"
#include "Solution.h"

bool checkUsedNumbers(const std::vector<int> &usedNumbers) {
    for (int usedNumber: usedNumbers) {
        if (usedNumber > 1) {
            return false;
        }
    }
    return true;
}

bool solution::checkSolution(Board &board) {
    std::vector<int> usedNumbers = std::vector<int>(9);
    for (int i = 0; i < board.getHeight(); ++i) {
        for (int j = 0; j < board.getWidth(); ++j) {
            if (board.getCellType(i, j) == EmptyCell::Type::TYPE_INFO) {
                // horizontal
                // right
                int horizontalSum = 0, verticalSum = 0;
                for (int k = j + 1; k < board.getWidth(); ++k) {
                    // Maybe use k = j + 1 instead?
                    //if (k != j) {
                        if (board.getCellType(i, k) == EmptyCell::Type::TYPE_INPUT) {
                            horizontalSum += std::static_pointer_cast<InputCell>(board.getCells()[i][k])->m_actualValue;
                            usedNumbers[std::static_pointer_cast<InputCell>(board.getCells()[i][k])->m_actualValue -1]++;
                        } else {
                            break;
                        }
                   // }
                }
                if ((horizontalSum != std::static_pointer_cast<InfoCell>(board.getCells()[i][j])->m_horizontalSum) ||
                    !checkUsedNumbers(usedNumbers)) {
                    return false;
                }
                usedNumbers.assign(usedNumbers.size(), 0);
                // vertical
                // down
                for (int k = i + 1; k < board.getHeight(); ++k) {
                    // As in previous for.
                    //if (k != i) {
                        if (board.getCellType(k, j) == EmptyCell::Type::TYPE_INPUT) {
                            verticalSum += std::static_pointer_cast<InputCell>(board.getCells()[k][j])->m_actualValue;
                            usedNumbers[std::static_pointer_cast<InputCell>(board.getCells()[k][j])->m_actualValue - 1]++;
                        } else {
                            break;
                        }
                    //}
                }
                if ((verticalSum != std::static_pointer_cast<InfoCell>(board.getCells()[i][j])->m_verticalSum) ||
                    !checkUsedNumbers(usedNumbers)) {
                    return false;
                }
                usedNumbers.assign(usedNumbers.size(), 0);
            }
        }
    }
    return true;
}