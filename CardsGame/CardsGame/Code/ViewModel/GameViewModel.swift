//
//  GameViewModel.swift
//  CardsGame
//
//  Created by MIKHAIL ZHACHKO on 15.08.24.
//

import Foundation

class GameViewModel: ObservableObject {
    typealias Slot = GameModel<String>.Slot
    
    private var stopwatchTimer: Timer?
    var slots: Array<Slot> {
        return model.slots
    }
    var movies: Int {
        return model.movies
    }
    @Published var elapsedTime: TimeInterval = 0
    @Published var isStopWatchTimerRun = false
    @Published private var model = createMatchingGame()
    
    private static let slotsList = [
        ImagesConstants.slot1,
        ImagesConstants.slot2,
        ImagesConstants.slot3,
        ImagesConstants.slot4,
        ImagesConstants.slot5,
        ImagesConstants.slot6,
        ImagesConstants.slot7,
        ImagesConstants.slot8,
        ImagesConstants.slot1,
        ImagesConstants.slot2,
        ImagesConstants.slot3,
        ImagesConstants.slot4,
        ImagesConstants.slot5,
        ImagesConstants.slot6,
        ImagesConstants.slot7,
        ImagesConstants.slot8
        
        
    ]
    
    private static func createMatchingGame() -> GameModel<String> {
        return GameModel(numbersOfPairsOfSlots: 8) {pairIndex in
            if slotsList.indices.contains(pairIndex) {
                return slotsList[pairIndex]
            } else {
                return ImagesConstants.slot
            }
            
        }
    }
    
    func startStopwatch(){
        stopwatchTimer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { [weak self] timer in
            self?.elapsedTime += timer.timeInterval
        })
        
        isStopWatchTimerRun = true
    }
    func pauseWatch(){
        if let timer = stopwatchTimer {
            timer.invalidate()
            isStopWatchTimerRun = false
            
        }
    }
    func resetStopwatchTimer() {
        if let timer = stopwatchTimer {
            timer.invalidate()
            stopwatchTimer = nil
            elapsedTime = 0
            
            isStopWatchTimerRun = true
        }
    }
    
    func formattedElapsedTime() -> String {
        let minutes = Int(elapsedTime) / 60 % 60
        let seconds = Int(elapsedTime) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    func shuffle(){
        model.shuffle()
    }
    
    func chooseSlot(_ slot: Slot){
        return model.chooseSlot(slot: slot)
    }
    
    func resetGame(){
        model = GameViewModel.createMatchingGame()
    }
    
    func recreateGame(){
        resetGame()
        resetStopwatchTimer()
        shuffle()
        startStopwatch()
    }
    
    func winCheck() -> Bool{
        return model.checkAllSlotsMatching()
    }
}
