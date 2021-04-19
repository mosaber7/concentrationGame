//
//  Card.swift
//  Concetration
//
//  Created by Saber on 19/04/2021.
//

import Foundation

struct Card {
    var isMatched: Bool = false
    var isFaceUP: Bool = false
    var idenifier: Int
    static var identifierFactory = 0
    
    static func getUniqueIdentifier()-> Int{
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.idenifier = Card.getUniqueIdentifier()
    }
}
