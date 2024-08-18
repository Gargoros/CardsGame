//
//  GameView.swift
//  CardsGame
//
//  Created by MIKHAIL ZHACHKO on 15.08.24.
//

import SwiftUI

struct GameView: View {
    //MARK: - Properties
    @ObservedObject var viewModel: GameViewModel
    
    //MARK: - Views
    var body: some View {
        ZStack {
            
            BGGameView()
            
            GeometryReader { geometry in
                
                let columns = [
                    GridItem(.adaptive(
                        minimum: geometry.size.width * 0.12,
                        maximum: geometry.size.width * 0.24)),
                    GridItem(.adaptive(
                        minimum: geometry.size.width * 0.12,
                        maximum: geometry.size.width * 0.24)),
                    GridItem(.adaptive(
                        minimum: geometry.size.width * 0.12,
                        maximum: geometry.size.width * 0.24)),
                    GridItem(.adaptive(
                        minimum: geometry.size.width * 0.12,
                        maximum: geometry.size.width * 0.24)),
                ]
                
                VStack (spacing: 10) {
                    IconButtonView(
                        buttonImage: ImagesConstants.settingsButton,
                        action: {})
                    .frame(width: geometry.size.width * 0.3,
                           height: geometry.size.width * 0.3
                    )
                    .position(
                        x: geometry.size.width * 0.08,
                        y: geometry.size.height * 0.08
                    )
                
                    
                    GameInfoView(
                        movies: viewModel.movies,
                        timer: viewModel.formattedElapsedTime()
                    )
                    .frame(width: geometry.size.width,
                           height: geometry.size.height * 0.9)
                    .position(
                        x: geometry.size.width / 2,
                        y: geometry.size.height * 0.02
                    )
                    
                    LazyVGrid(columns: columns, spacing: 0){
                        ForEach(viewModel.slots) {slot in
                            SlotView(
                                slot
                            )
                            .animation(.default, value: viewModel.slots)
                            .padding(.vertical, 5)
                            .onTapGesture {
                                if viewModel.isStopWatchTimerRun {
                                    withAnimation(.easeInOut(duration: 0.3)) {
                                        viewModel.chooseSlot(slot)
                                    }
                                }
                            }
                            .rotation3DEffect(
                                .degrees(slot.isFaceUp || slot.isMatching ? 0 : 180),
                                axis: (x: 0.0, y: 1.0, z: 0.0)
                            )
                        }
                        .onAppear{
                            withAnimation(.easeInOut(duration: 0.5)){
                                viewModel.shuffle()
                                viewModel.startStopwatch()
                                
                            }
                        }
                        
                    }
                    .padding(.horizontal, 10)
                    
                    //MARK: - bottoms button
                    HStack(spacing: 15){
                        IconButtonView(
                            buttonImage: viewModel.isStopWatchTimerRun ?
                            ImagesConstants.pauseButton : ImagesConstants.playButton,
                            action: {
                                viewModel.isStopWatchTimerRun ?
                                viewModel.pauseWatch() : viewModel.startStopwatch()
                            })
                        .frame(width: geometry.size.width * 0.3,
                               height: geometry.size.width * 0.3)
                        
                        Spacer()
                        IconButtonView(
                            buttonImage: ImagesConstants.leftButton,
                            action: {
                                Router.shared.backToRoot()
                            })
                        .frame(width: geometry.size.width * 0.3,
                               height: geometry.size.width * 0.3)
                        Spacer()
                        IconButtonView(
                            buttonImage: ImagesConstants.undoRightButton,
                            action: {
                                withAnimation(.easeInOut(duration: 0.5)){
                                    viewModel.recreateGame()
                                }
                            })
                        .frame(width: geometry.size.width * 0.3,
                               height: geometry.size.width * 0.3)
                    }
                    
                    .position(
                        x: geometry.size.width / 2,
                        y: geometry.size.height * 0.07
                    )
                    
                }
            }
            .padding(20)
            
            
        }
        .onDisappear{
            viewModel.resetStopwatchTimer()
            viewModel.resetGame()
        }
        .overlay {
            if viewModel.winCheck() {
                WinView(
                    movies: viewModel.movies,
                    time: viewModel.formattedElapsedTime(),
                    reset: {
                        withAnimation(.easeInOut(duration: 0.5)){
                            viewModel.recreateGame()
                        }},
                    menu: {
                        Router.shared.backToRoot()
                    }
                )
                .ignoresSafeArea()
                .onAppear{
                    viewModel.pauseWatch()
                }
                
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    GameView(viewModel: GameViewModel())
}
