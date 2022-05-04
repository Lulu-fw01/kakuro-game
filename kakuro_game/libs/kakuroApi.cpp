#define EXPORT extern "C" __attribute__((visibility("default"))) __attribute__((used))

#include <cstring>
#include <string>
#include <ctype.h>

static char buffer[1024];

EXPORT
char* generateBoard(int height, int width, int difficulty) {
    std::string board = "inf#1\\1 emp inf#0\\16 inf#23\\0 emp emp inf#4\\4 inp#9 inp#0 inf#9\\0 inf#0\\27 inp#0 inp#0 inp#0 inp#0 inf#0\\10 inp#0 inp#0 inp#0 inp#0 emp inf#0\\11 inp#0 inp#0 emp";

    char *cstr = new char[board.length() + 1];
    strcpy(cstr, board.c_str());

    return cstr;
}