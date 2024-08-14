//
//  BGNotificationView.swift
//  CardsGame
//
//  Created by MIKHAIL ZHACHKO on 14.08.24.
//

import SwiftUI

struct BGNotificationView: View {
    //MARK: - Properties
    
    
    //MARK: - Views
    var body: some View {
        ZStack {
            BackgroundView()
            
            ZStack {
                
                LinearGradient(
                    colors: [
                        Color.clear,
                        Color.clear,
                        Color.black.opacity(0.4),
                        Color.black.opacity(1)
                    ],
                    startPoint: .top,
                    endPoint: .bottom)
                
                Image(ImagesConstants.menuIcon)
                    .resizable()
                    .scaleEffect(x: 0.9, y: 0.4)
                    .offset(y: -180)
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    BGNotificationView()
}
