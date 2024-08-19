//
//  Router.swift
//  CardsGame
//
//  Created by MIKHAIL ZHACHKO on 14.08.24.
//

import Foundation

final class Router: ObservableObject {
    
    static let shared = Router()
    @Published var path = [RouterEnum]()
    
    func showGame() {
        path.append(.game)
    }
    func showPrivacy() {
        path.append(.privacy)
    }
    
    func showMenu() {
        path.append(.menu)
    }
    
    func showNotification() {
        path.append(.notification)
    }
    func showSetting() {
        path.append(.setting)
    }
    
    func backToRoot() {
        path.removeAll()
    }
    
    func back() {
        path.removeLast()
    }
}
