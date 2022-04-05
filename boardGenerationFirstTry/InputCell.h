//
// Created by luka on 05.04.2022.
//

#ifndef BOARDGENERATIONFIRSTTRY_INPUTCELL_H
#define BOARDGENERATIONFIRSTTRY_INPUTCELL_H


#include "EmptyCell.h"

class InputCell : EmptyCell {
public:
    int value;
    InputCell();
    explicit InputCell(int value);
};


#endif //BOARDGENERATIONFIRSTTRY_INPUTCELL_H
