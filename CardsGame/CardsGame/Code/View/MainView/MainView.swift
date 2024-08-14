//
//  ContentView.swift
//  CardsGame
//
//  Created by MIKHAIL ZHACHKO on 14.08.24.
//

import SwiftUI

struct MainView: View {
    @State var isMenuRootScreen = false
    @State var offsetY: CGFloat = -150
    
    var body: some View {
        ZStack {
            if isMenuRootScreen{
                MenuView()
            }
            else {
                BGLoadingView()
                
                
                
                Image(ImagesConstants.fireIcon)
                    .resizable()
                    .scaleEffect(0.8)
                    .offset(y: offsetY)
            }
            
        }
        .ignoresSafeArea()
        .onAppear {
                    // Shrink the icon
                    withAnimation(.easeOut(duration: 1.75)) {
                        offsetY = -450
                    }
                    
                    // Enlarge the logo
            withAnimation(.easeInOut(duration: 2.2)) {
                        offsetY = -180

                    }
                    
                    // Do something after the animation is done
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.5){
                        isMenuRootScreen = true
                    }
                }
    }
}

#Preview {
    MainView()
}

