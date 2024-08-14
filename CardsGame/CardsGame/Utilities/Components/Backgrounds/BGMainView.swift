//
//  BGMainView.swift
//  CardsGame
//
//  Created by MIKHAIL ZHACHKO on 14.08.24.
//

import SwiftUI

struct BGMainView: View {
    //MARK: - Properties
    
    
    //MARK: - Views
    var body: some View {
        ZStack {
            BackgroundView()
            
            ZStack {
                Image(ImagesConstants.background3)
                    .resizable()
                    .scaleEffect(x: 2.2, y: 1.06)
                
                Image(ImagesConstants.menuIcon)
                    .resizable()
                    .scaleEffect(x: 0.9, y: 0.4)
                    .offset(y: -100)
                
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    BGMainView()
}
