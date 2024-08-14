//
//  GameModel.swift
//  CardsGame
//
//  Created by MIKHAIL ZHACHKO on 15.08.24.
//

import Foundation

struct GameModel<SlotContent> where SlotContent: Equatable {
    
    private(set) var slots: Array<Slot>
    private(set) var movies = 0
    
    init(numbersOfPairsOfSlots: Int, slotContentFactory: (Int) -> SlotContent){
        slots = [Slot]()
        
        for pairIndex in 0..<max(2, numbersOfPairsOfSlots) {
            let content = slotContentFactory(pairIndex)
            
            slots.append(Slot(slotName: content))
            slots.append(Slot(slotName: content))
        
        }
    }
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get { slots.indices.filter { index in slots[index].isFaceUp }.only }
        set { slots.indices.forEach { slots[$0].isFaceUp = (newValue == $0) }
        }
    }
    
    
    mutating func chooseSlot(slot: Slot) {
        
        if let chosenIndex = slots.firstIndex(where: { $0.id == slot.id })  {
            movies += 1
            if !slots[chosenIndex].isFaceUp, !slots[chosenIndex].isMatching {
                if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                    if slots[chosenIndex].slotName == slots[potentialMatchIndex].slotName {
                        slots[chosenIndex].isMatching = true
                        slots[potentialMatchIndex].isMatching = true
                    }
                    slots[chosenIndex].isFaceUp = true
                } else {
                    indexOfTheOneAndOnlyFaceUpCard = chosenIndex
                }
            }
            
        }
    }
    
    func checkAllSlotsMatching() -> Bool {
            for slot in slots {
                if !slot.isMatching {
                    return false
                }
            }
            return true
        }
    
    mutating func shuffle() {
        slots.shuffle()
    }
    
    
    struct Slot:Identifiable, Equatable {
        let id          = UUID()
        
        var isFaceUp    = false
        var isMatching  = false
        var hasBeenSeen = false
        let slotName:   SlotContent
    }
}
