//
//  BackgroundView.swift
//  CardsGame
//
//  Created by MIKHAIL ZHACHKO on 14.08.24.
//

import SwiftUI

struct BackgroundView: View {
    //MARK: - Properties
    
    
    //MARK: - Views
    var body: some View {
        Image(ImagesConstants.background1)
            .resizable()
            .scaleEffect(x: 2.2)
            .ignoresSafeArea()
    }
}

#Preview {
    BackgroundView()
}
