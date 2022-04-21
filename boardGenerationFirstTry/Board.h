//
// Created by luka on 21.04.2022.
//

#ifndef BOARDGENERATIONFIRSTTRY_BOARD_H
#define BOARDGENERATIONFIRSTTRY_BOARD_H


#include <vector>
#include "EmptyCell.h"
#include <memory>

class Board {
public:
    Board(int height, int width);
    std::vector<std::vector<std::shared_ptr<EmptyCell>>> getCells();
    int getHeight() const;
    int getWidth() const;
    bool isValid(int row, int column) const;
    void setCell(int raw, int column, EmptyCell::Type type);
    static void print(const Board &board);
    ~Board();

private:
    // TODO use shared pointer.
    std::vector<std::vector<std::shared_ptr<EmptyCell>>> m_cells;
    int m_height;
    int m_width;
};


#endif //BOARDGENERATIONFIRSTTRY_BOARD_H
