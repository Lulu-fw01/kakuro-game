#include "InputCell.h"

InputCell::InputCell() {
    value = 0;
}

InputCell::InputCell(int value) {
    this->value = value;
}

std::string InputCell::getCellStr() const {
    return " [" + std::to_string(value) + "] ";
}

EmptyCell::Type InputCell::getType() const {
    return Type::TYPE_INPUT;
}
