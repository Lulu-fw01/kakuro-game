#include "InfoCell.h"

InfoCell::InfoCell() {
    m_horizontalSum = 0;
    m_verticalSum = 0;
}

InfoCell::InfoCell(int hSum, int vSum) {
    m_horizontalSum = hSum;
    m_verticalSum = vSum;
}

std::string InfoCell::getCellStr() const {
    if (m_verticalSum <= 10 || m_horizontalSum < 10) {
        if (m_verticalSum <= 10 && m_horizontalSum < 10) {
            return " " + std::to_string(m_verticalSum) + "\\" + std::to_string(m_horizontalSum) + " ";
        } else {
            if (m_verticalSum <= 10) {
                return " " + std::to_string(m_verticalSum) + "\\" + std::to_string(m_horizontalSum);
            } else {
                return std::to_string(m_verticalSum) + "\\" + std::to_string(m_horizontalSum) + " ";
            }
        }
    } else {
        return std::to_string(m_verticalSum) + "\\" + std::to_string(m_horizontalSum);
    }
}

EmptyCell::Type InfoCell::getType() const {
    return Type::TYPE_INFO;
}
