//
//  Concetration.swift
//  Concetration
//
//  Created by Saber on 19/04/2021.
//

import Foundation


class Concetration {
    var cards = [Card]()
    
    func chooseCard(at index: Int){
        
        if cards[index].isFaceUP {
            cards[index].isFaceUP = false
        }else{
            cards[index].isFaceUP = true
        }
    }
    init(numberOFPairsOfCards: Int) {
        for _ in 0..<numberOFPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        cards = cards.shuffled()
    }
    
}
