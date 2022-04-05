//
// Created by luka on 05.04.2022.
//

#include <vector>
#include <iostream>
#include "Generator.h"
#include "EmptyCell.h"
#include "InfoCell.h"


std::vector<std::vector<EmptyCell *>> Generator::generate(int height, int width) {
    std::vector<std::vector<EmptyCell *>> board(height, std::vector<EmptyCell *>(width, new EmptyCell));

    for (int i = 1; i < height; ++i) {
        board[i][0] = new InfoCell();
    }

    for (int j = 1; j < width; ++j) {
        board[0][j] = new InfoCell();
    }

    return board;
}

void printBoard(const std::vector<std::vector<EmptyCell *>> &board) {
    for (const auto & i : board) {
        for (auto j : i) {
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

Generator::Generator() = default;


