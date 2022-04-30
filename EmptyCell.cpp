

#include "EmptyCell.h"

std::string EmptyCell::getCellStr() const {
    return " [X] ";
}

EmptyCell::Type EmptyCell::getType() const {
    return EmptyCell::TYPE_EMPTY;
}

EmptyCell::EmptyCell() = default;