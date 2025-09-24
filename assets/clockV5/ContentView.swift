import SwiftUI

struct ContentView: View {
    @State var time: Double = 0
    @State var hour: Double = 0
    @State var min: Double = 0
    
    @State var tapX: Double = 0
    @State var tapY: Double = 0
    @State var tapAngle: Double = 0
    @State var tapDist: Double = 0
    
    let minutesInADay:Double = 1440
    
    let clockRadius: Double = 100
    let hourHandRatio: Double = 0.6
    let minHandRatio: Double = 0.8
    
    let buttonHeight: Double = 40
    let buttonWidth: Double = 120
    let buttonSpacing: Double = 20
    var buttonCornerRadius: Double = 10
    
    
    func dayColor() -> Color {
        if time >= 390 && time < 1050 {
            return Color(hue:0.135,
                         saturation:0.6,
                         brightness:0.7)
        } else if time < 330 || time >= 1110 {
            return Color(hue:0.635,
                         saturation:0.6,
                         brightness:0.7)
        } else if time < 390 && time >= 330 {
            return Color(hue:(0.635 + (time-330)/120).truncatingRemainder(dividingBy: 1),
                         saturation:abs(0.6 - ((time-330)/60)/2 - 0.35)+0.35,
                         brightness:0.7)
        } else {
            return Color(hue:(1.135 - (time-1050)/120).truncatingRemainder(dividingBy: 1),
                         saturation:abs(0.6 - ((time-1050)/60)/2 - 0.35)+0.35,
                         brightness:0.7)
        }
    }
    
    func timeString() -> String {
        var hourStr: String = ""
        var minStr: String = ""
        
        hourStr = "\(Int(hour) % 12)"
        if Int(hour) % 12 < 10 {
            hourStr = "0\(Int(hour) % 12)"
        }
        
        minStr = "\(Int(min))"
        if min < 10 {
            minStr = "0\(Int(min))"
        }
        
        
        return "\(hourStr) : \(minStr) \(time < 720 ? "AM":"PM")"
    }
    
    func updateTime() {
        time = time + minutesInADay
        time = Double(Int(time) % Int(minutesInADay))    //clamp time
        
        hour = Double(Int(time/60) % 24)
        min = Double(Int(time) % 60)
    }
    
    func rad2deg(_ number: Double) -> Double {
        return number * 180 / .pi
    }
    
    var body: some View {
        GeometryReader() {geometry in
            ZStack() {
                // background
                Rectangle()
                    .foregroundStyle(Color.black)
                
                VStack() {
                    VStack() {
                        // info block
                        Text(timeString())
                            .foregroundStyle(dayColor())
                            .font(.title)
                            .bold()
                        
                        // CLock
                        ZStack() {
                            Circle()
                                .foregroundStyle(dayColor())
                                .frame(width:clockRadius*2,height:clockRadius*2)
                            
                            Circle()
                                .foregroundStyle(Color.black)
                                .frame(width:30,height:30)
                            // hour hand
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundStyle(Color.black)
                                .frame(width:10,height:clockRadius*hourHandRatio)
                                .offset(y:-clockRadius*hourHandRatio/2)
                                .rotationEffect(Angle(degrees:Double(time/2)))
                            // numbers
                            ZStack() {
                                ForEach(0..<23) { hour in
                                    VStack(spacing:0) {
                                        Text(String(hour%12))
                                            .foregroundStyle(Color.black)
                                            .bold()
                                            .rotationEffect(Angle(degrees:Double(-hour*30)))
                                        Spacer()
                                            .frame(width:10,height:170)
                                    }
                                    .rotationEffect(Angle(degrees:Double(hour*30)))
                                }
                            }
                        }.onTapGesture() {
                            time += 60
                            updateTime()
                        }
                    }
                    .padding(40)
                    
                    // Input
                    VStack(spacing:buttonSpacing) {
                        
                        // Buttons
                        VStack(spacing:buttonSpacing) {
                            // + 720
                            ZStack() {
                                RoundedRectangle(cornerRadius:buttonCornerRadius)
                                    .foregroundStyle(dayColor())
                                    .frame(width:3*buttonWidth + 2*buttonSpacing, height:buttonHeight)
                                
                                Button {
                                    time = Double(Int.random(in:0...23) * 60)
                                    updateTime()
                                } label: {
                                    Text("randomize time")
                                        .foregroundStyle(Color.black)
                                        .font(.title2)
                                        .bold()
                                        .frame(width:3*buttonWidth + 2*buttonSpacing,height:buttonHeight)
                                }
                            }
                        }
                        
                        
                    }
                }
            }
        }
    }
}
