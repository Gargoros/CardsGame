//
//  ContentView.swift
//  CardsGame
//
//  Created by MIKHAIL ZHACHKO on 14.08.24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("HGGG, world!")
                .font(Font.custom("Multiround Pro", size: 32))
        }
        .padding()
    }
}

#Preview {
    MainView()
}
