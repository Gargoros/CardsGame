//
//  Array+Extension.swift
//  CardsGame
//
//  Created by MIKHAIL ZHACHKO on 15.08.24.
//

import Foundation

extension Array {
    var only: Element? {
        return count == 1 ? first : nil
    }
}
