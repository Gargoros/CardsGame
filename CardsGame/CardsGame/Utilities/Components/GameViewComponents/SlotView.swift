//
//  SlotView.swift
//  CardsGame
//
//  Created by MIKHAIL ZHACHKO on 15.08.24.
//

import SwiftUI

struct SlotView: View {
    //MARK: - Properties
    typealias Slot = GameModel<String>.Slot
    
    let slot: Slot
    
    init(_ slot: Slot) {
        self.slot = slot
    }
    
    
    //MARK: - Views
    var body: some View {
        ZStack {
            if slot.isFaceUp || slot.isMatching {
                Image(slot.slotName)
                    .resizable()
                    .scaledToFit()
            } else {
                Image(ImagesConstants.slot)
                    .resizable()
                    .scaledToFit()
            }
        }
    }
}

#Preview {
    SlotView(GameModel<String>.Slot.init(slotName: ImagesConstants.slot))
}
