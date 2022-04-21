//
// Created by luka on 21.04.2022.
//

#include <iostream>
#include "Board.h"
#include "InfoCell.h"
#include "InputCell.h"

Board::Board(int height, int width) {
    m_height = height;
    m_width = width;
    m_cells = std::vector<std::vector<EmptyCell **>>(height, std::vector<EmptyCell **>(width,
                                                                                       reinterpret_cast<EmptyCell **>(new EmptyCell)));
}

std::vector<std::vector<EmptyCell **>> Board::getCells() {
    return m_cells;
}

/**
 * Height of the board.
 * */
int Board::getHeight() const {
    return m_height;
}

/**
 * Width of the board
 * */
int Board::getWidth() const {
    return m_width;
}

/**
 * Check if info cell can be placed here.
 * */
bool Board::isValid(int row, int column) const {
    if (row == m_height - 2 || column == m_width - 2) {
        return false;
    }

    int lefter = column - 2;
    if (lefter >= 0) {
        int prevL = column - 1;
        if ((*m_cells[row][lefter])->getType() == EmptyCell::Type::TYPE_INFO &&
                (*m_cells[row][prevL])->getType() == EmptyCell::Type::TYPE_INPUT) {
            return false;
        }
    }

    int higher = row - 2;
    if (higher >= 0) {
        int prevH = row - 1;
        if ((*m_cells[higher][column])->getType() == EmptyCell::Type::TYPE_INFO &&
                (*m_cells[prevH][column])->getType() == EmptyCell::Type::TYPE_INPUT) {
            return false;
        }
    }
    return true;
}

void Board::setCell(int row, int column, EmptyCell::Type type) {
    EmptyCell* ptr;
    switch (type) {
        case EmptyCell::Type::TYPE_EMPTY:
            ptr = new EmptyCell;
            break;
        case EmptyCell::TYPE_INFO:
            ptr = new InfoCell;
            break;
        case EmptyCell::TYPE_INPUT:
            ptr = new InputCell;
            break;
    }
    m_cells[row][column] = &ptr;
}

/**
 * Print board in console.
 * */
void Board::print(const Board &board) {
    for (const auto &i: board.m_cells) {
        for (auto j: i) {
            if ((*j)->getType() == EmptyCell::Type::TYPE_INFO) {
                std::cout << "\033[31m"<< (*j)->getCellStr() <<"\033[0m ";
            } else {
                std::cout << (*j)->getCellStr() << " ";
            }
        }
        std::cout << std::endl;
    }

}

Board::~Board() {
    /*for (auto i: m_cells) {
        for (int j = 0; j < m_width; ++j) {
            delete i[j];
        }
    }*/
}
