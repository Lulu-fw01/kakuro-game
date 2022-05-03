#ifndef BOARDGENERATION_BOARD_H
#define BOARDGENERATION_BOARD_H

#include <vector>
#include <memory>
#include "Block.h"
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

    EmptyCell::Type getCellType(int row, int column) const;

    void setIndexes();

    std::string toNativeFormat() const;

private:
    std::vector<std::vector<std::shared_ptr<EmptyCell>>> m_cells;
    int m_height;
    int m_width;

    bool checkUpLeft(int row, int column) const;

    std::string cellToNativeFormat(int row, int column) const;
};

#endif //BOARDGENERATION_BOARD_H