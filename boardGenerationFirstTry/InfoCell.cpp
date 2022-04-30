#include "InfoCell.h"

InfoCell::InfoCell() {
    horizontalSum = 0;
    verticalSum = 0;
}

InfoCell::InfoCell(int hSum, int vSum) {
    horizontalSum = hSum;
    verticalSum = vSum;
}

std::string InfoCell::getCellStr() const {
    if (verticalSum <= 10 || horizontalSum < 10) {
        if (verticalSum <= 10 && horizontalSum < 10) {
            return " " + std::to_string(verticalSum) + "\\" + std::to_string(horizontalSum) + " ";
        } else {
            if (verticalSum <= 10) {
                return " " + std::to_string(verticalSum) + "\\" + std::to_string(horizontalSum);
            } else {
                return std::to_string(verticalSum) + "\\" + std::to_string(horizontalSum) + " ";
            }
        }
    } else {
        return std::to_string(verticalSum) + "\\" + std::to_string(horizontalSum);
    }
}

EmptyCell::Type InfoCell::getType() const {
    return Type::TYPE_INFO;
}