//
//  NotificationView.swift
//  CardsGame
//
//  Created by MIKHAIL ZHACHKO on 15.08.24.
//

import SwiftUI

struct NotificationView: View {
    //MARK: - Properties
    
    
    //MARK: - Views
    var body: some View {
        ZStack{
            BGNotificationView()
            
            VStack(spacing: 10){
                Spacer()
                
                Text(StringConstants.notificationsString.uppercased())
                    .modifier(NotificationTextModifier())
                
                Text(StringConstants.stayTunedString)
                    .modifier(StayTunedTextModifier())
                
                Button {
                    //TODO: - Add functionality
                } label: {
                    HStack {
                        Spacer()
                        Text(StringConstants.iWantBonusesString)
                            .modifier(IWantBonusesTextModifier())
                        Spacer()
                        
                    }
                    .background(Color.appYellow)
                    .cornerRadius(8, corners: .allCorners)
                    .padding(.vertical, 20)
                }
                
                Button{
                    Router.shared.backToRoot()
                } label: {
                    Text(StringConstants.skipString)
                        .modifier(SkipTextModifier())
                }
                

                    
            }
            .padding()
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    NotificationView()
}
