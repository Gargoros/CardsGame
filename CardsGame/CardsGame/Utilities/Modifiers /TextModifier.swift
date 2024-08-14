//
//  TextModifier.swift
//  CardsGame
//
//  Created by MIKHAIL ZHACHKO on 14.08.24.
//

import SwiftUI

struct LoadingTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(.white)
            .font(.custom(CustomFonts.muller.rawValue, size: 21))
    }
}

struct NotificationTextModifier: ViewModifier{
    
    func body(content: Content) -> some View {
        content
            .foregroundStyle(Color.white)
            .font(Font.custom(CustomFonts.inter.rawValue, size: 26).weight(.bold))
            .multilineTextAlignment(.center)
            .lineLimit(2)
            .minimumScaleFactor(0.01)
    }
}

struct StayTunedTextModifier: ViewModifier{
    
    func body(content: Content) -> some View {
        content
            .foregroundStyle(Color.appGray)
            .font(Font.custom(CustomFonts.inter.rawValue, size: 18).weight(.medium))
            .multilineTextAlignment(.center)
            .lineLimit(2)
            .minimumScaleFactor(0.1)
            .padding(.horizontal)
    }
}

struct IWantBonusesTextModifier: ViewModifier{
    
    func body(content: Content) -> some View {
        content
            .foregroundStyle(Color.black)
            .font(Font.custom(CustomFonts.inter.rawValue, size: 18).weight(.medium))
            .multilineTextAlignment(.center)
            .lineLimit(1)
            .minimumScaleFactor(0.1)
            .padding()
    }
}

struct SkipTextModifier: ViewModifier{
    
    func body(content: Content) -> some View {
        content
            .foregroundStyle(Color.appGray)
            .font(Font.custom(CustomFonts.inter.rawValue, size: 18).weight(.medium))
    }
}

struct GameTextModifier: ViewModifier{
    
    func body(content: Content) -> some View {
        content
            .foregroundStyle(Color.white)
            .font(Font.custom(CustomFonts.multiroundPro.rawValue, size: 18).weight(.regular))
            .padding()
    }
}

struct GameMoviesAndTimeTextModifier: ViewModifier{
    
    func body(content: Content) -> some View {
        content
            .foregroundStyle(Color.white)
            .font(Font.custom(CustomFonts.multiroundPro.rawValue, size: 18).weight(.regular))
    }
}
