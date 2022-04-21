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

Board Generator::generate(int height, int width, int difficulty) {
    std::srand(static_cast<unsigned int>(time(nullptr)));
    // TODO add difficulty.
    // Create empty board.
    Board board(height, width);
    createPattern(board);

    return board;
}

void printBoard(const std::vector<std::vector<EmptyCell *>> &board) {
    for (const auto &i: board) {
        for (auto j: i) {
            if (j->getType() == EmptyCell::Type::TYPE_INFO) {
                std::cout << "\033[31m"<< j->getCellStr() <<"\033[0m ";
            } else {
                std::cout << j->getCellStr() << " ";
            }
        }
        std::cout << std::endl;
    }
}

void Generator::generateAndPrint() {
    auto board = generate(10, 10, 1);

    Board::print(board);
}

int Generator::getRandomNum(int min, int max) {
    return min + rand() % (max - min + 1);
}

int Generator::getNext() {
    // TODO add difficulty.
    return getRandomNum(3, 9);
}

void Generator::createPattern(Board &board) {

    // Fill first row with Info cells.
    for (int i = 1; i < board.getHeight(); ++i) {
        board.setCell(i, 0, EmptyCell::Type::TYPE_INFO);
    }

    // Fill first column with Info cells.
    for (int j = 1; j < board.getWidth(); ++j) {
        board.setCell(0, j, EmptyCell::Type::TYPE_INFO);
    }

    addInfoCells(board);
}

void Generator::addInfoCells(Board &board) {
    int next;
    int infoMissedCount = 0;
    bool infoNext;
    std::set<int> hSet;
    for (int i = 1; i < board.getHeight(); i++) {
        for (int j = 1; j < board.getWidth(); j++) {
            infoNext = false;
            if (infoMissedCount > 0) {
                if (board.isValid(i, j)) {
                    infoNext = true;
                    infoMissedCount--;
                }
            }
            next = getNext();
            if (hSet.find(next) == hSet.end()) {
                hSet.insert(next);
            } else {
                if (board.isValid(i, j)) {
                    if (infoNext) {
                        infoMissedCount++;
                    }
                    infoNext = true;
                } else {
                    infoMissedCount++;
                }
                hSet.clear();
            }

            if (infoNext) {
                board.setCell(i, j, EmptyCell::Type::TYPE_INFO);
            } else {
                board.setCell(i, j, EmptyCell::Type::TYPE_INPUT);
            }
        }
    }
}


