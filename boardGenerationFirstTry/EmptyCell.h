#ifndef BOARDGENERATIONFIRSTTRY_EMPTYCELL_H
#define BOARDGENERATIONFIRSTTRY_EMPTYCELL_H

#include <string>
#include <vector>

class EmptyCell {
public:
    EmptyCell();

    virtual std::string getCellStr() const;

    enum Type {
        TYPE_EMPTY,
        TYPE_INFO,
        TYPE_INPUT
    };

    virtual Type getType() const;

    int m_rowNumber = 0, m_columnNumber = 0;
};


#endif //BOARDGENERATIONFIRSTTRY_EMPTYCELL_H
