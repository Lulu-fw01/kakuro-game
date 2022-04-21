//
// Created by luka on 05.04.2022.
//

#ifndef BOARDGENERATIONFIRSTTRY_GENERATOR_H
#define BOARDGENERATIONFIRSTTRY_GENERATOR_H


#include "EmptyCell.h"
#include "Board.h"
#include <vector>

class Generator {
public:

    static Board generate(int height, int width, int difficulty);

    static void generateAndPrint();

private:
    static int getRandomNum(int min, int max);
    static int getNext();
    static void createPattern(Board& board);
    static void addInfoCells(Board& board);
    static void addEmptyCells(Board& board);
};


#endif //BOARDGENERATIONFIRSTTRY_GENERATOR_H
