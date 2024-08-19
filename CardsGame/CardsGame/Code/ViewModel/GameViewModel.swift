//
//  GameViewModel.swift
//  CardsGame
//
//  Created by MIKHAIL ZHACHKO on 15.08.24.
//

import Foundation
import AVFoundation
import UIKit

class GameViewModel: ObservableObject {
    typealias Slot = GameModel<String>.Slot
    
    private var stopwatchTimer: Timer?
    private var audioPlayer: AVAudioPlayer?
    var slots: Array<Slot> {
        return model.slots
    }
    var movies: Int {
        return model.movies
    }
    
    @Published var isSettings = false
    @Published var isMute = true
    @Published var isVibro = true
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
    
    func setMute(){
        isMute.toggle()
    }
    
    func setVibro(){
        isVibro.toggle()
    }
    
    private func playSound(name: String, ext: String = "wav") {
        guard let soundURL = Bundle.main.url(forResource: name, withExtension: ext) else { return }
        
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            audioPlayer?.prepareToPlay()
            audioPlayer?.volume = 1
            audioPlayer?.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func onTapSound() {
        if isMute {
            playSound(name: StringConstants.buttonSound)
        }
    }
    
    func flipOverSound(){
        if isMute {
            playSound(name: StringConstants.scrapeSound)
        }
    }
    
    func hapticFeedbackOnTap(style: UIImpactFeedbackGenerator.FeedbackStyle = .medium){
        if isVibro {
            let impact = UIImpactFeedbackGenerator(style: style)
                  impact.impactOccurred()
        }
    }
}
