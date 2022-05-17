#ifndef API_INPUTCELL_H
#define API_INPUTCELL_H

#include "EmptyCell.h"
#include "vector"

struct InputCell : public EmptyCell {
public:
    int m_value = 0;
    int m_actualValue;

    InputCell();

    explicit InputCell(int value);

    std::string getCellStr() const override;

    Type getType() const override;

    std::vector<int> m_innerNumbers = std::vector<int>(9);

    std::vector<int> m_outerNumbers = std::vector<int>(9);
};

#endif //API_INPUTCELL_H
