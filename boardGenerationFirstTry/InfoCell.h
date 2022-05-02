#ifndef BOARDGENERATIONFIRSTTRY_INFOCELL_H
#define BOARDGENERATIONFIRSTTRY_INFOCELL_H

#include "EmptyCell.h"

struct InfoCell : public EmptyCell {
public:
    int horizontalSum;
    int verticalSum;

    InfoCell();

    InfoCell(int hSum, int vSum);

    std::string getCellStr() const override;

    Type getType() const override;
};

#endif //BOARDGENERATIONFIRSTTRY_INFOCELL_H