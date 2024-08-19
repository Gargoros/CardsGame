//
//  MenuView.swift
//  CardsGame
//
//  Created by MIKHAIL ZHACHKO on 14.08.24.
//

import SwiftUI

struct MenuView: View {
    //MARK: - Properties
    @ObservedObject var router = Router.shared
    @ObservedObject var game = GameViewModel()
    @State private var url = URL(string: StringConstants.url1)
    
    //MARK: - Views
    var body: some View {
        
        NavigationStack(path: $router.path) {
            ZStack {
                BGMainView()
                GeometryReader {geometry in
                    VStack (alignment: .center, spacing: 15){
                        NavigationLink(
                            value: RouterEnum.game) {
                                MenuButtonView(
                                    imageName: ImagesConstants.button1,
                                    buttonText: StringConstants.gameString)
                            }
                            .frame(
                                width: geometry.size.width * 0.65,
                                height: geometry.size.height * 0.12
                            )
                            .simultaneousGesture(TapGesture().onEnded {
                                game.onTapSound()
                                game.hapticFeedbackOnTap()
                                        })
                        VStack (spacing: 5){
                            NavigationLink(
                                value: RouterEnum.privacy) {
                                    MenuButtonView(
                                        imageName: ImagesConstants.button2,
                                        buttonText: StringConstants.privacyPolicyString)
                                }
                                .frame(
                                    width: geometry.size.width * 0.45,
                                    height: geometry.size.height * 0.08
                                )
                                .simultaneousGesture(TapGesture().onEnded {
                                    game.onTapSound()
                                    game.hapticFeedbackOnTap()
                                            })
                            
                            NavigationLink(
                                value: RouterEnum.notification) {
                                    MenuButtonView(
                                        imageName: ImagesConstants.button2,
                                        buttonText: StringConstants.notificationString)
                                }
                                .frame(
                                    width: geometry.size.width * 0.45,
                                    height: geometry.size.height * 0.08
                                )
                                .simultaneousGesture(TapGesture().onEnded {
                                    game.onTapSound()
                                    game.hapticFeedbackOnTap()
                                            })
                        }
                        .navigationDestination(for: RouterEnum.self) { route in
                            switch route {
                            case .menu:
                                MenuView()
                            case .game:
                                GameView(viewModel: game, path: router)
                            case .notification:
                                NotificationView()
                            case .setting:
                                SettingView(viewModel: game, path: router)
                            case .privacy:
                                PrivacyView(linkPage: $url)
                            }
                        }
                        .navigationBarBackButtonHidden(true)
                    }
                    .position(x: geometry.size.width / 2, y: geometry.size.height * 0.65)
                }
                
            }
            
        }
    }
}

#Preview {
    MenuView()
}
