//
//  PrivacyView.swift
//  CardsGame
//
//  Created by MIKHAIL ZHACHKO on 15.08.24.
//

import SwiftUI

struct PrivacyView: View {
    //MARK: - Properties
    @Binding var linkPage: URL?
    
    //MARK: - Views
    var body: some View {
        SafariView(url: linkPage ?? URL(string: StringConstants.url2)!)
            .ignoresSafeArea()
            .navigationBarBackButtonHidden(true)
        
    }
}

#Preview {
    PrivacyView(linkPage: .constant(URL(string: StringConstants.url1)))
}
