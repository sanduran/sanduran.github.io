//
//  Preset.swift
//  Memr
//
//  Created by Şan Güneş Duran on 3.06.2026.
//

import SwiftUI

class Preset: ObservableObject, Identifiable, Hashable {
    let id = UUID()
    
    let LIST_VIEW_HEIGHT: CGFloat = 100
    
    weak var main: Main?
    
    var name: String
    @Published var cards: [Card] = []
    
    init(_ main:Main, name: String) {
        self.main = main
        self.name = name
    }
    
    func addCard(_ card:Card) {
        cards.append(card)
    }
    
    func editCard(_ card:Card, front:String, back:String) {
        for i in 0..<cards.count {
            let c = cards[i]
            if card.front == c.front && card.back == c.back {
                cards[i] = Card(front: front, back: back)
                return
            }
        }
    }
    func deleteCard(_ card:Card) {
        for i in 0..<cards.count {
            let c = cards[i]
            if card.front == c.front && card.back == c.back {
                cards.remove(at:i)
                return
            }
        }
    }
    
    static func == (lhs: Preset, rhs: Preset) -> Bool {
        lhs.id == rhs.id
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

class PresetList: Identifiable, Hashable {
    let id = UUID()
    
    var preset:Preset
    
    init(preset:Preset) {
        self.preset = preset
    }
    
    static func == (lhs: PresetList, rhs: PresetList) -> Bool {
        lhs.id == rhs.id
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

struct PresetCardView: View {
    var presetList: PresetList
    var preset:Preset
    
    init(presetList: PresetList) {
        self.presetList = presetList
        self.preset = presetList.preset
    }
    
    var body: some View {
        Text(preset.name)
            .font(.title)
        List {
            ForEach(preset.cards, id: \.front) { card in
                CardView(card:card)
            }
        }
    }
}

struct PresetListView: View {
    @ObservedObject var preset: Preset
    
    var body: some View {
        HStack {
            Text(preset.name)
                .bold()
            Spacer()
            Text("cards: \(preset.cards.count)")
        }
    }
}

struct PresetView: View {
    @ObservedObject var preset: Preset
    
    @State var isCreateAlert = false
    @State var isEditAlert = false
    @State var chosenFront = ""
    @State var chosenBack = ""
    
    var body: some View {
        HStack {
            Spacer()
            Text(preset.name)
                .font(.title)
                .bold()
            Spacer()
            Button(action: {
                isCreateAlert = true
            }) {
                Image(systemName: "plus")
            }.alert(
                "Create a new card",
                isPresented: $isCreateAlert,
                actions: {
                    TextField("Enter front:", text: $chosenFront)
                        .autocorrectionDisabled()
                    TextField("Enter back:", text: $chosenBack)
                        .autocorrectionDisabled()
                    Button("Cancel") {
                        isCreateAlert = false
                        chosenFront = ""
                        chosenBack = ""
                    }
                    Button("Confirm") {
                        isCreateAlert = false
                        preset.addCard(Card(front: chosenFront, back: chosenBack))
                        chosenFront = ""
                        chosenBack = ""
                    }
                })
            .buttonStyle(.bordered)
            Spacer()
        }
        List {
            Section {
                Button(action: {
                    print("button pressed")
                    if let main = preset.main {
                        main.memrView(preset:preset)
                        print("button worked")
                    }
                }) {
                    ZStack {
                        Text("Card View")
                    }
                }.buttonStyle(.bordered)
            }
            ForEach(preset.cards, id: \.front) { card in
                Section {
                    HStack {
                        Button(action: {
                            preset.deleteCard(card)
                        }) {
                            ZStack {
                                Image(systemName: "trash")
                                    .foregroundStyle(.red)
                            }
                        }.buttonStyle(.bordered)
                        Spacer()
                        Button(action: {
                            isEditAlert = true
                            chosenFront = card.front
                            chosenBack = card.back
                        }) {
                            ZStack {
                                Text("Edit Text")
                            }
                        }.alert(
                            "Edit card",
                            isPresented: $isEditAlert,
                            actions: {
                                TextField("Enter front:", text: $chosenFront, )
                                    .autocorrectionDisabled()
                                TextField("Enter back:", text: $chosenBack)
                                    .autocorrectionDisabled()
                                Button("Cancel") {
                                    isEditAlert = false
                                    chosenFront = ""
                                    chosenBack = ""
                                }
                                Button("Confirm") {
                                    isEditAlert = false
                                    preset.editCard(card, front: chosenFront, back: chosenBack)
                                    chosenFront = ""
                                    chosenBack = ""
                                }
                            })
                        .buttonStyle(.bordered)
                    }
                    CardEditView(card: card)
                    Spacer(minLength: 20)
                }
                .listSectionSpacing(20)
            }
        }
    }
}
