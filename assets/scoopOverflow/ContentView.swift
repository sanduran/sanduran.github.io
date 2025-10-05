import SwiftUI

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.closeSubpath()
        return path
    }
}

struct ContentView: View {
    @State var scoop1:Color? = nil
    @State var scoop2:Color? = nil
    @State var scoop3:Color? = nil
    @State var scoop4:Color? = nil
    @State var scoop5:Color? = nil
    
    func addScoop() {
        if scoop1 == nil {
            scoop1 = .pink
        } else if scoop2 == nil {
            scoop2 = .yellow
        } else if scoop3 == nil {
            scoop3 = .white
        } else if scoop4 == nil {
            scoop4 = .mint
        } else if scoop5 == nil {
            scoop5 = .indigo
        } else {
            scoop1 = nil
            scoop2 = nil
            scoop3 = nil
            scoop4 = nil
            scoop5 = nil
        }

    }
    var body: some View {
        ZStack() {
            Rectangle()
                .fill(.black)
            Text("Click to add a scoop!")
                .foregroundStyle(Color.white)
                .font(.title)
                .bold()
                .offset(y:-400)
            Circle()
                .fill(scoop5 ?? .black)
                .frame(width: 200, height: 200)
                .offset(y:-270)
            Circle()
                .fill(scoop4 ?? .black)
                .frame(width: 200, height: 200)
                .offset(y:-190)
            Circle()
                .fill(scoop3 ?? .black)
                .frame(width: 200, height: 200)
                .offset(y:-110)
            Circle()
                .fill(scoop2 ?? .black)
                .frame(width: 200, height: 200)
                .offset(y:-30)
            Circle()
                .fill(scoop1 ?? .black)
                .frame(width: 200, height: 200)
                .offset(y:50)
            
            VStack {
                Triangle()
                    .fill(.brown)
                    .frame(width:200,height:400)
                    .offset(y:280)
            }
        }
        .onTapGesture {
            addScoop()
        }
    }
}
