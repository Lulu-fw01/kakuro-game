#ifndef API_GENERATOR_H
#define API_GENERATOR_H

#include <vector>
#include <set>

#include "EmptyCell.h"
#include "Board.h"

namespace generation {

    /**
     * Difficulty of the field.
     * */
    enum Difficulty {
        DIFFICULTY_HARD = 1,
        DIFFICULTY_MEDIUM,
        DIFFICULTY_EASY,
        DIFFICULTY_BEGINNER
    };

    Board generate(int height, int width, generation::Difficulty difficulty);

    void createPattern(Board &board, generation::Difficulty difficulty);

    void addInfoCells(Board &board, generation::Difficulty difficulty);

    void addEmptyCells(Board &board);

    void fillPenultimateRow(Board &board, int &infoMissedCount, std::set<int> &hSet, generation::Difficulty difficulty);

    void fillPenultimateColumn(Board &board, int &infoMissedCount, std::set<int> &hSet, generation::Difficulty difficulty);

    void fillNumbers(Board &board);

    void fillSums(Board &board);

    std::vector<std::vector<Block>> findBlocks(Board &board);
};

#endif //API_GENERATOR_H
