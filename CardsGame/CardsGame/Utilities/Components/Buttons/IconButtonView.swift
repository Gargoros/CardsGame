//
//  IconButtonView.swift
//  CardsGame
//
//  Created by MIKHAIL ZHACHKO on 14.08.24.
//

import SwiftUI

struct IconButtonView: View {
    //MARK: - Properties
    let buttonImage: String
    var action: () -> Void
    
    //MARK: - Views
    var body: some View {
        Button{
            action()
        } label: {
            Image(buttonImage)
                .resizable()
                .scaledToFit()
        }
    }
}

#Preview {
    IconButtonView(buttonImage: ImagesConstants.playButton, action: {})
}
