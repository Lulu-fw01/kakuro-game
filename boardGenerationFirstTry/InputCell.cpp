//
// Created by luka on 05.04.2022.
//

#include "InputCell.h"

InputCell::InputCell() {
    value = 0;
}

InputCell::InputCell(int value) {
    this->value = value;
}

std::string InputCell::getCellStr() const {
    return std::to_string(value);
}
