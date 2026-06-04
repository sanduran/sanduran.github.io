//
//  ContentView.swift
//  Memr
//
//  Created by Şan Güneş Duran on 3.06.2026.
//

import SwiftUI

class Main: ObservableObject {
    @Published var presets: [Preset] = []
    @Published var path = NavigationPath()
    
    func addPreset(_ preset:Preset) {
        presets.append(preset)
    }
    func memrView(preset:Preset) {
        print("memrView called")
        path.append(PresetList(preset: preset))
    }
    
}

struct MainView: View {
    @ObservedObject var main: Main
    
    @State private var isAlert = false
    @State private var chosenName:String = ""
    
    var body: some View {
        NavigationStack(path: $main.path) {
            // Top bar
            HStack {
                Spacer()
                Text("Saved Presets")
                    .font(.title)
                    .bold()
                Spacer()
                Button(action: {
                    isAlert = true
                }) {
                    Image(systemName: "plus")
                }.alert(
                    "Create a new preset",
                    isPresented: $isAlert,
                    actions: {
                        TextField("Enter name:", text: $chosenName)
                            .autocorrectionDisabled()
                        Button("Cancel") {
                            isAlert = false
                            chosenName = ""
                        }
                        Button("Confirm") {
                            isAlert = false
                            let preset = Preset(main, name: chosenName)
                            main.addPreset(preset)
                            chosenName = ""
                            main.path.append(preset)
                        }
                    })
                .buttonStyle(.bordered)
                Spacer()
            }
            List {
                ForEach(main.presets, id: \.name) { preset in
                    NavigationLink(value: preset) {
                        PresetListView(preset: preset)
                    }
                }
            }
            .navigationDestination(for: Preset.self) { preset in
                return PresetView(preset: preset)
            }
            .navigationDestination(for: PresetList.self) { presetList in
                print("destination reached")
                return PresetCardView(presetList: presetList)
            }
        }
    }
}

#Preview {
    MainView(main:Main())
}
