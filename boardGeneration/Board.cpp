#include <iostream>
#include <sstream>
#include <utility>
#include "Board.h"
#include "InfoCell.h"
#include "InputCell.h"
#include "Block.h"

/**
 * @brief Constructor.
 *
 * @param height height of the field (number of rows).
 * @param width width of the field (number of columns).
 * */
Board::Board(int height, int width) {
    m_height = height;
    m_width = width;
    m_cells = std::vector<std::vector<std::shared_ptr<EmptyCell> >>(height,
                                                                    std::vector<std::shared_ptr<EmptyCell>>(width,
                                                                                                            std::make_shared<EmptyCell>()));
}

std::vector<std::vector<std::shared_ptr<EmptyCell>>> Board::getCells() {
    return m_cells;
}

/**
 * @brief Height of the board.
 * */
int Board::getHeight() const {
    return m_height;
}

/**
 * @brief Width of the board
 * */
int Board::getWidth() const {
    return m_width;
}

bool Board::checkUpLeft(int row, int column) const {
    int lefter = column - 2;
    if (lefter >= 0) {
        int prevL = column - 1;
        if (m_cells[row][lefter]->getType() == EmptyCell::Type::TYPE_INFO &&
            m_cells[row][prevL]->getType() == EmptyCell::Type::TYPE_INPUT) {
            return false;
        }
    }

    int higher = row - 2;
    if (higher >= 0) {
        int prevH = row - 1;
        if (m_cells[higher][column]->getType() == EmptyCell::Type::TYPE_INFO &&
            m_cells[prevH][column]->getType() == EmptyCell::Type::TYPE_INPUT) {
            return false;
        }
    }
    return true;
}

/**
 * @brief Method for checking if cells righter than chosen allow for chosen to be info.
 *
 * @param row row number.
 * @param column column number.
 * */
bool Board::isRightValid(int row, int column) const {
    if (column == m_width - 1) {
        return true;
    }
    if (column == m_width - 2 && (m_cells[row][column + 1] == nullptr || getCellType(row, column + 1) == EmptyCell::Type::TYPE_INPUT)) {
        return false;
    }
    if (m_cells[row][column + 1] == nullptr) {
        return true;
    }
    if (getCellType(row, column + 1) == EmptyCell::Type::TYPE_INPUT && getCellType(row, column + 2) != EmptyCell::Type::TYPE_INPUT) {
        return false;
    }
    return true;
}

/**
 * @brief Method for checking if cells lefter than chosen allow for chosen to be info.
 *
 * @param row row number.
 * @param column column number.
 * */
bool Board::isLeftValid(int row, int column) const {
    if (column == 0 || column == 1) {
        return true;
    }
    if (getCellType(row, column - 1) == EmptyCell::Type::TYPE_INPUT && getCellType(row, column - 2) != EmptyCell::Type::TYPE_INPUT) {
        return false;
    }
    return true;
}

/**
 * @brief Method for checking if cells higher than chosen allow for chosen to be info.
 *
 * @param row row number.
 * @param column column number.
 * */
bool Board::isHigherValid(int row, int column) const {
    if (row == 0 || row == 1) {
        return true;
    }
    if (getCellType(row - 1, column) == EmptyCell::Type::TYPE_INPUT && getCellType(row - 2, column) != EmptyCell::Type::TYPE_INPUT) {
        return false;
    }
    return true;
}

/**
 * @brief Method for checking if cells below than chosen allow for chosen to be info.
 *
 * @param row row number.
 * @param column column number.
 * */
bool Board::isBelowValid(int row, int column) const {
    if (row == m_height - 1) {
        return true;
    }
    if (row == m_height - 2 && (m_cells[row + 1][column] == nullptr || getCellType(row + 1, column) == EmptyCell::Type::TYPE_INPUT)) {
        return false;
    }
    if (m_cells[row + 1][column] == nullptr) {
        return true;
    }
    if (getCellType(row + 1, column) == EmptyCell::Type::TYPE_INPUT && m_cells[row + 2][column] != nullptr && getCellType(row + 2, column) != EmptyCell::Type::TYPE_INPUT) {
        return false;
    }
    return true;
}

/**
 * @brief Check if info cell can be placed here.
 * It checks cells lefter and higher than cell[row, column]
 *
 * @attention for every cell in penultimate Row orColumn answer will be false.
 *
 * @param row row number.
 * @param column column number.
 * */
bool Board::isValidUpLeft(int row, int column) const {
    if (row == m_height - 2 || column == m_width - 2) {
        return false;
    }

    return checkUpLeft(row, column);
}

/**
 * @brief Check if info cell can be placed here.
 *
 * @attention Method for checking cells in penultimate Row.
 *
 * @param column column number.
 * */
bool Board::isValidUpLeftDown(int column) const {
    return (getCellType(m_height - 1, column) == EmptyCell::Type::TYPE_INFO) && checkUpLeft(m_height - 2, column);
}

/**
 * @brief Check if info cell can be placed here.
 * It checks cells lefter and higher than cell[row, column].
 * @attention Method for checking cells in penultimate Column.
 *
 * @param row row number.
 * */
bool Board::isValidUpLeftRight(int row) const {
    return (getCellType(row, m_width - 1) == EmptyCell::Type::TYPE_INFO) && checkUpLeft(row, m_width - 2);
}

/**
 * @brief Set cell type.
 *
 * @param row row number.
 * @param column column number.
 * @param type type of the cell.
 * */
void Board::setCell(int row, int column, EmptyCell::Type type) {
    std::shared_ptr<EmptyCell> ptr;
    switch (type) {
        case EmptyCell::Type::TYPE_EMPTY:
            ptr = std::make_shared<EmptyCell>();
            break;
        case EmptyCell::TYPE_INFO:
            ptr = std::make_shared<InfoCell>();
            break;
        case EmptyCell::TYPE_INPUT:
            ptr = std::make_shared<InputCell>();
            break;
    }
    m_cells[row][column] = ptr;
}

/**
 * @brief Print board in console.
 * */
void Board::print(const Board &board) {
    for (const auto &i: board.m_cells) {
        for (const auto &j: i) {
            if (j->getType() != EmptyCell::Type::TYPE_INPUT) {
                std::cout << "\033[31m" << j->getCellStr() << "\033[0m ";
            } else {
                std::cout << j->getCellStr() << " ";
            }
        }
        std::cout << std::endl;
    }
    std::cout << std::endl;

}

/**
 * @brief Type of cell in board.
 *
 * @param row row number.
 * @param column column number.
 * */
EmptyCell::Type Board::getCellType(int row, int column) const {
    return m_cells[row][column]->getType();
}

void Board::setIndexes() {
    for (int i = 0; i < m_height; ++i) {
        for (int j = 0; j < m_width; ++j) {
            m_cells[i][j]->m_rowNumber = i;
            m_cells[i][j]->m_columnNumber = j;
        }
    }
}

/**
 * @brief This function converts board to string with cells in native format.
 * */
std::string Board::toNativeFormat() const {
    std::string result;
    for (int i = 0; i < m_height; ++i) {
        for (int j = 0; j < m_width; ++j) {
            result += cellToNativeFormat(i, j);
            if (i != m_height - 1 || j != m_width - 1) {
                result += " ";
            }
        }
    }

    return result;
}

std::string Board::cellToNativeFormat(int row, int column) const {
    switch (m_cells[row][column]->getType()) {
        case EmptyCell::Type::TYPE_EMPTY:
            return "emp";
        case EmptyCell::Type::TYPE_INFO: {
            auto cell = std::static_pointer_cast<InfoCell>(m_cells[row][column]);
            return "inf#" + std::to_string(cell->m_verticalSum) + "\\" + std::to_string(cell->m_horizontalSum);
        }
        case EmptyCell::Type::TYPE_INPUT: {
            auto val = std::static_pointer_cast<InputCell>(m_cells[row][column])->m_value;
            return "inp#" + std::to_string(val);
        }
        default:
            return "";
    }
}

std::shared_ptr<EmptyCell> cellFromNativeFormat(const std::string &cell) {
    std::shared_ptr<EmptyCell> ptr;

    std::stringstream stream(cell);
    std::string type;
    std::string content;
    std::getline(stream, type, '#');
    std::getline(stream, content, '#');

    std::string val1, val2;
    std::stringstream  contentStream(content);
    std::getline(contentStream, val1, '\\');
    std::getline(contentStream, val2, '\\');

    if (type == "inf") {
        ptr = std::make_shared<InfoCell>();
        auto inf = std::static_pointer_cast<InfoCell>(ptr);
        inf->m_verticalSum = std::stoi(val1);
        inf->m_horizontalSum = std::stoi(val2);
    } else if (type == "inp") {
        ptr = std::make_shared<InputCell>();
        auto inp = std::static_pointer_cast<InputCell>(ptr);
        inp->m_value = std::stoi(val1);
        inp->m_actualValue = std::stoi(val2);
    }

    return ptr;
}

Board Board::boardFromNativeFormat(int height, int width, const std::string &boardString) {
    Board board = Board(height, width);
    std::stringstream stream(boardString);

    std::string next;
    for (int i = 0; i < height; ++i) {
        for (int j = 0; j < width; ++j) {
            stream >> next;
            if (next != "emp") {
                board.setCell(i, j, cellFromNativeFormat(next));
            }
        }
    }
    return board;
}

void Board::setCell(int row, int column, std::shared_ptr<EmptyCell> cell) {
    m_cells[row][column] = std::move(cell);
}
