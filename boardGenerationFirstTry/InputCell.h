#ifndef BOARDGENERATIONFIRSTTRY_INPUTCELL_H
#define BOARDGENERATIONFIRSTTRY_INPUTCELL_H

#include "EmptyCell.h"
#include "vector"

class InputCell : public EmptyCell {
public:
    int value = 0;

    InputCell();

    explicit InputCell(int value);

    std::string getCellStr() const override;

    Type getType() const override;

    std::vector<int> innerNumbers = std::vector<int>(9);

    std::vector<int> outerNumbers = std::vector<int>(9);
};

#endif //BOARDGENERATIONFIRSTTRY_INPUTCELL_H
