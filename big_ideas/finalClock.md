[home](https://sanduran.github.io) | [projects](https://sanduran.github.io/projects) | [big ideas](https://sanduran.github.io/big_ideas) | [documentation](https://sanduran.github.io/documentation)

# BIG IDEAS
### Final Clock
This is how we forged the one clock to rule them all.  
![preview](https://sanduran.github.io/assets/finalClock/finalClockPreview.gif)  
First things first we had to find a target audience and we cose teenagers because we are teenagers. After that we collected some ideas through google and put them on a Figjam ideas board. We tried to find designs that were minimal and simplistic to fit our target audience.
![preview](https://sanduran.github.io/assets/finalClock/figjamBoard.png)  
We decided on two that we liked most.  
![preview](https://sanduran.github.io/assets/finalClock/figjamBoardFinal.png)  

After the idea collecting phase we started making a desig for the clock. We took the hands of the first clock and the colors of the second and mixed them together.  
![preview](https://sanduran.github.io/assets/finalClock/figmaDesign.png) 

The next step was doing the programming. For that I used the code frm my [previous clock project](https://sanduran.github.io/projects/swiftClock) and made some adjustments.
```
func switchMode() {
    if mode == 0 {
        mode = 1
            
        backgroundColor = Color(hue: 0, saturation: 0, brightness: 0.85)
        mainColor = Color(hue: 0,saturation:0, brightness:0.75)
        accentColor = Color(hue: 0.108, saturation: 0.69, brightness: 0.81)
        buttonColor = Color(hue: 0,saturation:0, brightness:0.75)
    } else {
        mode = 0
            
        backgroundColor = Color.black
        mainColor = Color(hue: 0, saturation: 0, brightness: 0.85)
        accentColor = Color(hue: 0.108, saturation: 0.69, brightness: 0.81)
        buttonColor = Color(hue: 0,saturation:0, brightness:0.25)
    }
}
```  
I made variables for different colors I used to make theme easier to change and I added a function to toggle between light and dark modes.
