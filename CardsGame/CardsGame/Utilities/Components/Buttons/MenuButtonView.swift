//
//  MenuButtonView.swift
//  CardsGame
//
//  Created by MIKHAIL ZHACHKO on 14.08.24.
//

import SwiftUI

struct MenuButtonView: View {
    //MARK: - Properties
    let imageName: String
    let buttonText: String
    
    //MARK: - Views
    var body: some View {
        ZStack {
            Image(imageName)
                .resizable()
                .scaledToFit()
            Text(buttonText)
                .modifier(GameTextModifier())
        }
    }
}

#Preview {
    MenuButtonView(
        imageName: ImagesConstants.button1,
        buttonText: StringConstants.gameString)
}
