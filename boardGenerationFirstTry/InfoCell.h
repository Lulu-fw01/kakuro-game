

#ifndef KAKUROTEST_INFOCELL_H
#define KAKUROTEST_INFOCELL_H

#include "EmptyCell.h"

class InfoCell : public EmptyCell {
public:
    int horizontalSum;
    int verticalSum;
    InfoCell();
    InfoCell(int hSum, int vSum);
    std::string getCellStr() const override ;
    Type getType() const override;
};

#endif //KAKUROTEST_INFOCELL_H
