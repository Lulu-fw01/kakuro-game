//
// Created by luka on 05.04.2022.
//

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
    return std::to_string(verticalSum) + "\\" + std::to_string(horizontalSum);
}

EmptyCell::Type InfoCell::getType() const {
    return Type::TYPE_INFO;
}
