//
//  BGLoadingView.swift
//  CardsGame
//
//  Created by MIKHAIL ZHACHKO on 14.08.24.
//

import SwiftUI

struct BGLoadingView: View {
    //MARK: - Properties
    
    
    //MARK: - Views
    var body: some View {
        ZStack {
            BackgroundView()
            
            ZStack {
                Image(ImagesConstants.background3)
                    .resizable()
                    .scaleEffect(x: 2.2, y: 1.06)
                
                Text(StringConstants.loadingString)
                    .modifier(LoadingTextModifier())
                
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    BGLoadingView()
}
