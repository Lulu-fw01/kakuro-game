//
// Created by luka on 05.04.2022.
//

#include <vector>
#include <set>
#include <iostream>
#include "Generator.h"
#include "EmptyCell.h"
#include "InfoCell.h"
#include "InputCell.h"

std::vector<std::vector<EmptyCell *>> Generator::generate(int height, int width) {
    // TODO add difficulty.
    std::vector<std::vector<EmptyCell *>> board(height, std::vector<EmptyCell *>(width, new EmptyCell));

    for (int i = 1; i < height; ++i) {
        board[i][0] = new InfoCell();
    }

    for (int j = 1; j < width; ++j) {
        board[0][j] = new InfoCell();
    }

    // TODO position validating.
    int next;
    for (int i = 1; i < height; i++) {
        std::set<int> hSet;
        for (int j = 1; j < width; j++) {
            next = getNext();
            if (hSet.find(next) == hSet.end()) {
                hSet.insert(next);
                board[i][j] = new InputCell;
            } else {
                board[i][j] = new InfoCell;
                hSet.clear();
            }
        }
    }
    return board;
}

void printBoard(const std::vector<std::vector<EmptyCell *>> &board) {
    for (const auto &i: board) {
        for (auto j: i) {
            std::cout << (*j).getCellStr() << " ";
        }
        std::cout << std::endl;
    }
}

void Generator::generateAndPrint() {
    auto board = generate(10, 10);

    printBoard(board);
    /*for (const auto & i : board) {
        for (int j = 0; j < i.size(); ++j) {
            delete i[j];
        }
    }*/
}

int Generator::getRandomNum(int min, int max) {
    return min + rand() % (max - min + 1);
}

Generator::Generator() {
    std::srand(static_cast<unsigned int>(time(nullptr)));
}

int Generator::getNext() {
    return getRandomNum(3, 9);
}

/**
 * Check if info cell can be placed here.
 * */
bool Generator::isValid(const std::vector<std::vector<EmptyCell *>> &field, int row, int column) {
    if (row == field.size() - 2 || column == field[0].size() - 2) {
        return false;
    }

    int lefter = column - 2;
    int higher = row - 2;

    if (lefter >= 0 ) {
        auto lefterType = typeid(field[row][lefter]).name();
        if (lefterType == typeid(InfoCell).name()) {
            return false;
        }
    }
    if (higher >= 0) {
        auto higherType = typeid(field[higher][column]).name();
        if (higherType == typeid(InfoCell).name()) {
            return false;
        }
    }
    return true;
}


