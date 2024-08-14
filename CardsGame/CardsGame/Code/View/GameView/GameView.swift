//
//  GameView.swift
//  CardsGame
//
//  Created by MIKHAIL ZHACHKO on 15.08.24.
//

import SwiftUI

struct GameView: View {
    //MARK: - Properties
    
    
    //MARK: - Views
    var body: some View {
        Text("GameView")
            .foregroundStyle(.black)
            .font(.largeTitle)
            .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    GameView()
}
