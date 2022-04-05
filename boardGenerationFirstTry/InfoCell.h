//
// Created by luka on 05.04.2022.
//

#ifndef BOARDGENERATIONFIRSTTRY_INFOCELL_H
#define BOARDGENERATIONFIRSTTRY_INFOCELL_H


#include "EmptyCell.h"

class InfoCell : EmptyCell {
public:
    int horizontalSum;
    int verticalSum;
    InfoCell();
    InfoCell(int hSum, int vSum);

};


#endif //BOARDGENERATIONFIRSTTRY_INFOCELL_H
