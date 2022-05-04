#define EXPORT extern "C" __attribute__((visibility("default"))) __attribute__((used))

#include <cstring>
#include <string>
#include <ctype.h>

#include "Generator.h"

static char buffer[1024];

EXPORT
char* generateBoard(int height, int width, int difficulty) {
    auto board = generation::generate(height, width, static_cast<generation::Difficulty>(difficulty));
    std::string strBoard = board.toNativeFormat();

    char *cstr = new char[strBoard.length() + 1];
    strcpy(cstr, strBoard.c_str());

    return cstr;
}