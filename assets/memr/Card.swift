//
//  Card.swift
//  Memr
//
//  Created by Şan Güneş Duran on 3.06.2026.
//

import SwiftUI

struct Card {
    var front: String
    var back: String
}

struct CardView: View {
    let height: CGFloat = 300
    var card: Card
    @State var isFront: Bool = true
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius:10)
                .foregroundStyle(.white)
            if isFront == true {
                Text(card.front)
                    .font(.title2)
            } else {
                Text(card.back)
                    .font(.title2)
            }
        }
        .aspectRatio(3/4, contentMode: .fit)
        .frame(maxHeight:CGFloat.infinity)
        .onTapGesture {
            isFront = !isFront
        }
    }
}

struct CardEditView: View {
    let height: CGFloat = 300
    var card: Card
    @State var isFront: Bool = true
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius:10)
                .foregroundStyle(.white)
            if isFront == true {
                Text(card.front)
                    .font(.title2)
            } else {
                Text(card.back)
                    .font(.title2)
            }
        }
        .aspectRatio(4/3, contentMode: .fit)
        .frame(maxHeight:CGFloat.infinity)
        .onTapGesture {
            isFront = !isFront
        }
    }
}

/*
struct aCardEditView: View {
    let height: CGFloat = 300
    var card: Card
    @State var isFront: Bool = true
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius:10)
                .foregroundStyle(.gray)
            VStack {
                HStack {
                    Button(action: {
                        
                    }) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 5)
                                .foregroundStyle(.white)
                            Image(systemName: "trash")
                                .foregroundStyle(.red)
                        }
                    }
                    .buttonStyle(.bordered)
                    .frame(width:100, height:50)
                }
                //BUDB
            }
        }
    }
}
*/
