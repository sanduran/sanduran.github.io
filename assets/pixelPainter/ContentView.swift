import SwiftUI

let gridx: Int = 10          // Number of columns
let gridy: Int = 10          // Number of rows
let squareDimensions: CGFloat = 50   // Size of each square
let squareCornerRadius: CGFloat = 5  // Roundness of square corners

// One single square
struct Square: View {
    var color: Color         // Square color
    var id: Int              // Square number
    var cornerRadius: CGFloat
    var sideLength: CGFloat
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: squareCornerRadius) // Draw square
                .frame(width:squareDimensions,height:squareDimensions) // Set size
                .foregroundStyle(color) // Set color
            Text("\(id)") // Show id number
                .frame(width:squareDimensions,height:squareDimensions) // Set size
                .bold()
        }
    }
}

// Creates the full grid
struct ColorGrid: View {
    var colorList: Array<Array<Color>> // 2D color list
    var gridx: Int
    var gridy: Int
    var squareDimensions: CGFloat
    var squareCornerRadius: CGFloat
    
    var body: some View {
        HStack { // Horizontal rows
            ForEach(0...gridx-1, id: \.self) { x in
                VStack { // Vertical columns
                    ForEach(0...gridy-1, id: \.self) { y in
                        Square(
                            color: colorList[x][y], // Use color from list
                            id: y*10+x,             // Calculate id
                            cornerRadius: squareCornerRadius,
                            sideLength: squareDimensions
                        )
                    }
                }
            }
        }
    }
}

struct Palette: View {
    var paletteList: Array<Color>
    var radius: CGFloat
    var colorCount: Int
    
    var body: some View {
        HStack {
            ForEach(0..<colorCount, id: \.self) { i in
                if i < paletteList.count {
                    Circle()
                        .frame(width:radius*2, height:radius*2)
                        .foregroundStyle(paletteList[i])
                } else {
                    Circle()
                        .frame(width:radius*2, height:radius*2)
                        .foregroundStyle(.gray)
                }
            }
        }
    }
}

// Main view
struct ContentView: View {
    @State var colorList = Array(repeating: Array(repeating: Color.gray, count: gridy), count: gridx) // Grid colors
    @State var selectedGridStr: String = "" // Selected square
    @State var redStr:String = ""
    @State var greenStr:String = ""
    @State var blueStr:String = ""
    @State var paletteList:Array<Color> = [Color.gray, Color.gray, Color.gray, Color.gray, Color.gray]
    
    // Variables for invalid input message
    @State var promptColor:Color = Color.gray
    @State var promptText:String = "Enter a grid number:"
    
    func idToCoord(_ id:Int) -> Array<Int>{
        let x:Int = id % gridx
        let y:Int = id / gridy
        return [x,y]
    }
    
    // Changes the color of one square
    func updateColorList(_ id:Int, _ color:Color) -> Void {
        let coords:Array<Int> = idToCoord(id) // Get position
        colorList[coords[0]][coords[1]] = color // Set new color
    }
    
    // Adds a new color and shifts the palette
    func updatePaletteList(_ color:Color) -> Void {
        paletteList.insert(color, at:0)
        paletteList = Array(paletteList[...4])
    }
    
    var body: some View {
        VStack {
            HStack {
                VStack { // Text input
                    TextField("", text: $selectedGridStr, prompt: Text(promptText).foregroundColor(promptColor))
                    TextField("Red:", text: $redStr)
                    TextField("Green:", text: $greenStr)
                    TextField("Blue:", text: $blueStr)
                }.textFieldStyle(.roundedBorder)
                
                Button("Confirm") { // Button input
                    if let selectedGridInt = Int(selectedGridStr) {
                        if selectedGridInt < 100 && selectedGridInt >= 0 {
                            promptColor = Color.gray
                            promptText = "Enter a grid number:"
                            
                            if let red = Int(redStr), let green = Int(greenStr), let blue = Int(blueStr) {
                                
                                updateColorList(
                                    Int(selectedGridInt),
                                    Color(
                                        red:Double(red)/255,
                                        green:Double(green)/255,
                                        blue:Double(blue)/255
                                    )
                                )
                                updatePaletteList(
                                    Color(
                                        red:Double(red)/255,
                                        green:Double(green)/255,
                                        blue:Double(blue)/255
                                    )
                                )
                            }
                        } else {
                            selectedGridStr = ""
                            promptColor = Color.red
                            promptText = "Enter a valid number(0-99):"
                        }
                    } else {
                        selectedGridStr = ""
                        promptColor = Color.red
                        promptText = "Enter a valid number(0-99):"
                    }
                }
                .buttonStyle(.bordered)
            }
            .frame(width: CGFloat(gridx) * squareDimensions + CGFloat(8 * (gridx-1)))
            
            // Palette
            Palette(paletteList:paletteList, radius:squareDimensions/2, colorCount:5)
            
            // Grid
            ColorGrid(
                colorList: colorList,
                gridx: gridx,
                gridy: gridy,
                squareDimensions: squareDimensions,
                squareCornerRadius: squareCornerRadius
            )
        }
    }
}
