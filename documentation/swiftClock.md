[home](https://sanduran.github.io) | [projects](https://sanduran.github.io/projects) | [big ideas](https://sanduran.github.io/big_ideas) | [documentation](https://sanduran.github.io/documentation)

# DOCUMENTATION
### Simple Clock made using Swift Playground
A simple clock made to practice with swift. This was the biggest project I had done yet and it was also better than the others. I used my previous knowledge of swift but I had to learn new stuff in addition to some math.  
Sliders:  
I wanted to add a slider to be able to control time easily but it proved to be more challenging compared to the simple buttons I had done before.  
"""  
Slider(value: Binding(
  get: { Double(time) },
  set: { newVal in
    time = newVal
    updateTime()
  }),
    in: 0...minutesInADay-1, step: 1
)
"""  
To create a slider in swift playground you need to create a Slider structure with the value, in and step parameters. The value is the current position of the slider, the in property is the range of the value and the step is the minimum amount of change for the value. I used a bining for the value to bind the value to one of my own variables.

Clicking on the clock:  
I wanted to be able to click on the clock and have the hour hand point in the direction I clicked to input time more intuitively. This was the most challenging part of the whole project and I spent the most time on it. I figured that I needed to have the angle of the line passing through the center of the clock and my mouse click. After some searching I found the trigonomic function [atan2](https://en.wikipedia.org/wiki/Atan2) which takes two points and returns the angle between them. I could then use the value I got from the function to change the time accordingly.  

[download for mac](https://sanduran.github.io/assets/swiftClock/ClockV2.zip)
