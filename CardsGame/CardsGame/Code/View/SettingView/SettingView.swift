//
//  SettingView.swift
//  CardsGame
//
//  Created by MIKHAIL ZHACHKO on 15.08.24.
//

import SwiftUI

struct SettingView: View {
    //MARK: - Properties
    @ObservedObject var viewModel: GameViewModel
    @ObservedObject var path: Router
    
    //MARK: - Views
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .center, spacing: geometry.size.height * 0.07){
                
                MenuButtonView(
                    imageName: ImagesConstants.button2,
                    buttonText: StringConstants.resume
                )
                .onTapGesture {
                    viewModel.isSettings.toggle()
                    viewModel.onTapSound()
                    viewModel.hapticFeedbackOnTap()
                }
                .frame(width: geometry.size.width * 0.55)
                
                MenuButtonView(
                    imageName: ImagesConstants.button2,
                    buttonText: StringConstants.mainMenu
                )
                .onTapGesture {
                    viewModel.onTapSound()
                    viewModel.hapticFeedbackOnTap()
                    path.backToRoot()
                }
                .frame(width: geometry.size.width * 0.55)
                
                HStack(spacing: 60){
                    IconButtonView(
                        buttonImage: viewModel.isMute ? 
                        ImagesConstants.muteSoundButton : ImagesConstants.speakerButton,
                        action: {
                            viewModel.onTapSound()
                            viewModel.hapticFeedbackOnTap()
                            viewModel.setMute()
                        }
                    )
                    .frame(width: geometry.size.width * 0.16,
                           height: geometry.size.width * 0.16)
                    
                    IconButtonView(
                        buttonImage: viewModel.isVibro ?
                        ImagesConstants.noVibroButton : ImagesConstants.vibroButton,
                        action: {
                            viewModel.onTapSound()
                            viewModel.hapticFeedbackOnTap()
                            viewModel.setVibro()
                        }
                    )
                    .frame(width: geometry.size.width * 0.16,
                           height: geometry.size.width * 0.16)
                }
                
            }
            .background(content: {
                Image(ImagesConstants.frame2)
                    .resizable()
                    .scaledToFit()
                    .frame(width: geometry.size.width,
                           height: geometry.size.height)
            })
        }
    }
}

#Preview {
    SettingView(viewModel: GameViewModel(), path: Router.shared)
}
