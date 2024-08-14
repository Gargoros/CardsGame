//
//  MenuView.swift
//  CardsGame
//
//  Created by MIKHAIL ZHACHKO on 14.08.24.
//

import SwiftUI

struct MenuView: View {
    //MARK: - Properties
    
    
    //MARK: - Views
    var body: some View {
        Text("Menu View")
            .foregroundStyle(.black)
            .font(Font.custom(CustomFonts.multiroundPro.rawValue, size: 32).weight(.regular))
    }
}

#Preview {
    MenuView()
}
