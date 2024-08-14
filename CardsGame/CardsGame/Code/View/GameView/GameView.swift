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
                    
                    
                    //MARK: - LazyVGrid()
                    LazyVGrid(columns: columns, spacing: 0){
                        ForEach(viewModel.slots) {slot in
                            SlotView(
                                slot
                            )
                            .animation(.default, value: viewModel.slots)
                            .padding(.vertical, 5)
                            .onTapGesture {
                                withAnimation(.easeInOut(duration: 0.3)) {
                                    viewModel.chooseSlot(slot)
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
                                viewModel.startStop()
                                
                            }
                        }
                        
                    }
                    .padding(.horizontal, 10)
                    
                    //MARK: - bottoms button
                    HStack(spacing: 20){
                        IconButtonView(
                            buttonImage: ImagesConstants.playButton,
                            action: {})
                        .frame(width: geometry.size.width * 0.3,
                               height: geometry.size.width * 0.3)
                        
                        Spacer()
                        IconButtonView(
                            buttonImage: ImagesConstants.leftButton,
                            action: {})
                        .frame(width: geometry.size.width * 0.3,
                               height: geometry.size.width * 0.3)
                        Spacer()
                        IconButtonView(
                            buttonImage: ImagesConstants.undoRightButton,
                            action: {})
                        .frame(width: geometry.size.width * 0.3,
                               height: geometry.size.width * 0.3)
                    }
                    
                    .position(
                        x: geometry.size.width / 2,
                        y: geometry.size.height * 0.08
                    )
                    
                }
            }
            .padding(20)
            
            
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    GameView(viewModel: GameViewModel())
}
