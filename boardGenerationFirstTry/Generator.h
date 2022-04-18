//
// Created by luka on 05.04.2022.
//

#ifndef BOARDGENERATIONFIRSTTRY_GENERATOR_H
#define BOARDGENERATIONFIRSTTRY_GENERATOR_H


#include "EmptyCell.h"
#include <vector>

class Generator {
public:
    Generator();

    static std::vector<std::vector<EmptyCell *>> generate(int height, int width);

    static void generateAndPrint();

private:
    static int getRandomNum(int min, int max);
    static int getNext();
    static bool isValid(const std::vector<std::vector<EmptyCell *>> &field, int raw, int column);
};


#endif //BOARDGENERATIONFIRSTTRY_GENERATOR_H
