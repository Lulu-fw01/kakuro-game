//
// Created by luka on 05.04.2022.
//

#ifndef BOARDGENERATIONFIRSTTRY_INPUTCELL_H
#define BOARDGENERATIONFIRSTTRY_INPUTCELL_H


#include "EmptyCell.h"

class InputCell : public EmptyCell {
public:
    int value = 0;
    InputCell();
    explicit InputCell(int value);
    std::string getCellStr() const override;
    Type getType() const override;
};


#endif //BOARDGENERATIONFIRSTTRY_INPUTCELL_H
