//
// Created by luka on 21.04.2022.
//

#ifndef BOARDGENERATIONFIRSTTRY_BOARD_H
#define BOARDGENERATIONFIRSTTRY_BOARD_H


#include <vector>
#include <memory>

#include "EmptyCell.h"

class Board {
public:
    Board(int height, int width);

    std::vector<std::vector<std::shared_ptr<EmptyCell>>> getCells();

    int getHeight() const;

    int getWidth() const;

    bool isValidUpLeft(int row, int column) const;

    bool isValidUpLeftDown(int column) const;

    bool isValidUpLeftRight(int row) const;

    void setCell(int row, int column, EmptyCell::Type type);

    static void print(const Board &board);

    std::shared_ptr<EmptyCell> getCell(int row, int column);

    EmptyCell::Type getCellType(int row, int column) const;

    ~Board();

private:
    // TODO use shared pointer.
    std::vector<std::vector<std::shared_ptr<EmptyCell>>> m_cells;
    int m_height;
    int m_width;

    bool checkUpLeft(int row, int column) const;
};


#endif //BOARDGENERATIONFIRSTTRY_BOARD_H
