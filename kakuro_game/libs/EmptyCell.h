#ifndef API_EMPTYCELL_H
#define API_EMPTYCELL_H

#include <string>
#include <vector>

struct EmptyCell {
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


#endif //API_EMPTYCELL_H
