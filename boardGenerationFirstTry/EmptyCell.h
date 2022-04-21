//
// Created by luka on 05.04.2022.
//

#ifndef BOARDGENERATIONFIRSTTRY_EMPTYCELL_H
#define BOARDGENERATIONFIRSTTRY_EMPTYCELL_H

#include <string>

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
};


#endif //BOARDGENERATIONFIRSTTRY_EMPTYCELL_H
