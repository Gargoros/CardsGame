//
//  BGWinView.swift
//  CardsGame
//
//  Created by MIKHAIL ZHACHKO on 14.08.24.
//

import SwiftUI

struct BGWinView: View {
    //MARK: - Properties
    
    
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
        }
        .ignoresSafeArea()
    }
}

#Preview {
    BGWinView()
}
