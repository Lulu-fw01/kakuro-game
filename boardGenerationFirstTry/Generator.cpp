//
// Created by luka on 05.04.2022.
//

#include <vector>
#include <set>
#include <iostream>
#include "Generator.h"
#include "EmptyCell.h"

/**
 * @brief generate new kakuro board.
 *
 * */
Board Generator::generate(int height, int width, int difficulty) {
    std::srand(static_cast<unsigned int>(time(nullptr)));
    // TODO add difficulty.
    // Create empty board.
    Board board(height, width);
    createPattern(board);

    return board;
}

/**
 * @brief Temporary method for generating and printing board.
 * */
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

/**
 * @brief method for creating pattern on the board.
 * Pattern it is board filled <p> with EmptyCells, InfoCells and InputCells but without values.
 *
 * @param board kakuro board.
 * */
void Generator::createPattern(Board &board) {
    board.setCell(0, 0, EmptyCell::Type::TYPE_EMPTY);

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

/**
 * @brief this function randomly adds InfoCells on kakuro board.
 *
 * @param board kakuro board.
 * */
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

/**
 * This function change useless InfoCells with EmptyCells.
 * */
void Generator::addEmptyCells(Board &board) {

}



