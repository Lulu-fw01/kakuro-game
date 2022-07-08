# kakuro-game
![kakuro-game-logo](https://github.com/Lulu-fw01/kakuro-game/blob/master/kakuro_game/assets/icon/icon.jpg)

**This app was written jointly with [Varvara](https://github.com/barbararr) as part of a second-year course project at the Higher School of Economics**.
___
## About kakuro
This is type of logical puzzle with numbers also known as cross sums. The board consists of two types of cells. First type of cells is cells with information about sums of bottom cells and sums of righter cells. Secoond type of cells is input cells where player write his answers.<p>
Game rules:<p>
  - Input cells filled with numbers from 1 to 9;
  - Amount of all numbers in row or column should be equal to corresponding number in cell with information;
  - In one block all numers should be different (block is input cells between two cells with information or between cell with information and end of field);
  - Every puzzle has at least one solution.
  
 Example of solution:
 <p align="center">
    <img src="https://www.kakuro-online.com/images/unsolved.png">
    <img src="https://www.kakuro-online.com/images/solved.png">
 </p>
 
____  
## kakuro game
  ### Menu
  - In our game you can choose board size (height and width, from 5 x 5 to 14 x 14);
  - Moreover, you can choose game difficulty:
    - beginner;
    - easy;
    - medium;
    - hard.
<p align="center">
  <img src="https://github.com/Lulu-fw01/kakuro-game/blob/master/screenshots/flutter_10.png" height = 500 width = 275>
</p>
  
  ### Game process
<p align="center">
  <img src="https://github.com/Lulu-fw01/kakuro-game/blob/master/screenshots/flutter_02.png" height = 500 width = 275>
</p>
This is game screen of our app.<p> 

   - Here you can see kakuro field with different cells. If you click on input cell you will see dialog where you can select value for the cell; 
  <p align="center">
    <img src="https://github.com/Lulu-fw01/kakuro-game/blob/master/screenshots/flutter_09.png" height = 500 width = 275>
  </p>

   - You can open options buttons if you click on pink button in right bottom:
   <p align="center">
    <img src="https://github.com/Lulu-fw01/kakuro-game/blob/saveSettings/screenshots/flutter_02.png" height = 500 width = 275>
    <img src="https://github.com/Lulu-fw01/kakuro-game/blob/saveSettings/screenshots/flutter_04.png" height = 500 width = 275>
  </p>
  
   - You can ask for a prompt by clicking option button with lamp icon. The cell with the corrected answer will flash yellow:
   <p align="center">
    <img src="https://github.com/Lulu-fw01/kakuro-game/blob/master/screenshots/flutter_06.png" height = 500 width = 275>
  </p>

   - If you click button with reward icon game will show you correct answer:
   <p align="center">
    <img src="https://github.com/Lulu-fw01/kakuro-game/blob/master/screenshots/flutter_07.png" height = 500 width = 275>
  </p>
  
   - If you think that you solved the game you can check your answer by clicking green button in left bottom:
   <p align="center">
    <img src="https://github.com/Lulu-fw01/kakuro-game/blob/saveSettings/screenshots/flutter_03.png" height = 500 width = 275>
    <img src="https://github.com/Lulu-fw01/kakuro-game/blob/saveSettings/screenshots/flutter_08.png" height = 500 width = 275>
  </p>
  
____
## Run and build process
Run and build process you can find [here](kakuro_game/README.md).
