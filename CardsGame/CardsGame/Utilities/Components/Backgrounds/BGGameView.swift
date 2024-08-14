//
//  BGGameView.swift
//  CardsGame
//
//  Created by MIKHAIL ZHACHKO on 14.08.24.
//

import SwiftUI

struct BGGameView: View {
    //MARK: - Properties
    
    
    //MARK: - Views
    var body: some View {
        ZStack {
            Image(ImagesConstants.background2)
                .resizable()
                .scaleEffect(x: 2.2)
                
        }
        .ignoresSafeArea()
    }
}

#Preview {
    BGGameView()
}
