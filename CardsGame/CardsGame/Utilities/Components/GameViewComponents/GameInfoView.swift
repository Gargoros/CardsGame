//
//  GameInfoView.swift
//  CardsGame
//
//  Created by MIKHAIL ZHACHKO on 15.08.24.
//

import SwiftUI

struct GameInfoView: View {
    //MARK: - Properties
    let movies: Int
    let timer: String
    //MARK: - Views
    var body: some View {
        HStack {
            HStack(spacing: 0){
                Text(StringConstants.moviesString)
                Text("\(movies)")
                
                Spacer()
                
                Text(StringConstants.timeString)
                Text(timer)
            }
            .padding(.horizontal)
        }
        
        .modifier(GameMoviesAndTimeTextModifier())
        .background(
            Image(ImagesConstants.groupBGButton)
                .resizable()
                .scaledToFit()
                .frame(width: nil, height: 100)
        )
    }
}

#Preview {
    GameInfoView(movies: 12, timer: "00:00")
}
