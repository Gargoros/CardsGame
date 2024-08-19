//
//  WinView.swift
//  CardsGame
//
//  Created by MIKHAIL ZHACHKO on 18.08.24.
//

import SwiftUI

struct WinView: View {
    //MARK: - Properties
    let movies: Int
    let time: String
    let reset: () -> Void
    let menu: () -> Void
    let size: CGFloat = 55
    
    //MARK: - Views
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [
                    Color.black.opacity(0.8),
                    Color.black.opacity(0.8)
                ],
                startPoint: .top,
                endPoint: .bottom)
            
            Image(ImagesConstants.background3)
                .resizable()
                .scaleEffect(x: 2.2, y: 1.06)
            
            VStack {
                Image(ImagesConstants.frame1)
                    .resizable()
                    .scaledToFit()
                    .overlay {
                        VStack {
                            Spacer()
                            HStack(spacing: 0) {
                                Text(StringConstants.moviesString)
                                Text("\(movies)")
                            }
                            HStack(spacing: 0)  {
                                Text(StringConstants.timeString.uppercased())
                                Text(time)
                            }
                        }
                        .padding(.bottom, 40)
                        .modifier(GameMoviesAndTimeTextModifier())
                        .multilineTextAlignment(.center)
                }
                
                HStack(spacing: 10){
                    Spacer()
                    IconButtonView(
                        buttonImage: ImagesConstants.undoLeftButton,
                        action: reset)
                    .frame(width: size, height: size)
                    IconButtonView(
                        buttonImage: ImagesConstants.menuButton,
                        action: menu)
                    .frame(width: size, height: size)
                    Spacer()
                }
            }
                .offset(y: 100)
                .padding()
                .padding(.horizontal, 20)
            Image(ImagesConstants.youWin)
                .resizable()
                .scaledToFit()
                .offset(y: -80)
                .padding()
        }
        .ignoresSafeArea()
    }
}

#Preview {
    WinView(movies: 12, time: "12:00", reset: {}, menu: {})
}
