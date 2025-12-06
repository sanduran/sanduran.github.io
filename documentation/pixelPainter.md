[home](https://sanduran.github.io) | [projects](https://sanduran.github.io/projects) | [big ideas](https://sanduran.github.io/big_ideas) | [documentation](https://sanduran.github.io/documentation)

# DOCUMENTATION
### A Simple Pixel Painter

#### 1)
We use two loops(one loop for rows, one loop for columns):  
The outer loop goes through each column (0 to 9). Inside it, another loop goes through each row (0 to 9). Each time both loops run once, one square is drawn. Adding up to a total of 100 squares.

#### 2)
Row number = vertical position  
Column number = horizontal position

The cell index (ID) is calculated like this in logic:  
cell index = (row × 10) + column

This gives every square a unique number from 0 to 99.

#### 3)
When the user presses the Confirm button:
###### 1, The program checks if:
  - The grid number is a real number
  - The RGB values are real numbers
###### 2, If the number is between 0 and 99:
  - That square’s color is changed to the new color
  - The new color is added to the color palette
###### 3, If the number is not between 0 and 99:
  - The program should say “Enter a valid number”

#### Functions
A function is a part of the program that does one job.  
Examples in my program:
###### 1, “idToCoord”
  - Turns a square number into row and column positions.
###### 2, “updateColorList”
  - Changes the color of one square.
###### 3, “updatePaletteList”
  - Adds a new color to the palette.

[Code](https://github.com/sanduran/sanduran.github.io/blob/main/assets/pixelPainter/ContentView.swift)
