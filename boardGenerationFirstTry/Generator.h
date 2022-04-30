#ifndef BOARDGENERATIONFIRSTTRY_GENERATOR_H
#define BOARDGENERATIONFIRSTTRY_GENERATOR_H

#include <vector>
#include <set>

#include "EmptyCell.h"
#include "Board.h"

class Generator {
public:

    static Board generate(int height, int width, int difficulty);

    static void generateAndPrint();

    static int getRandomNum(int min, int max);

private:

    static int getNext();

    static void createPattern(Board &board);

    static void addInfoCells(Board &board);

    static void addEmptyCells(Board &board);

    static void fillPenultimateRow(Board &board, int &infoMissedCount, std::set<int> &hSet);

    static void fillPenultimateColumn(Board &board, int &infoMissedCount, std::set<int> &hSet);

    static void fillNumbers(Board &board);

    static void fillSums(Board &board);

    static std::vector<std::vector<Block>> findBlocks(Board &board);
};

#endif //BOARDGENERATIONFIRSTTRY_GENERATOR_H
