#include "InputCell.h"

InputCell::InputCell() {
    m_value = 0;
}

InputCell::InputCell(int value) {
    this->m_value = value;
}

std::string InputCell::getCellStr() const {
    return " [" + std::to_string(m_value) + "] ";
}

EmptyCell::Type InputCell::getType() const {
    return Type::TYPE_INPUT;
}
