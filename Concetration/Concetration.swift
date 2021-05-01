//
//  Concetration.swift
//  Concetration
//
//  Created by Saber on 19/04/2021.
//

import Foundation


class Concetration {
    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUPCard: Int?
    
    func chooseCard(at index: Int){
        
        if !cards[index].isMatched {
            if let matchedIndex = indexOfOneAndOnlyFaceUPCard, matchedIndex != index{
                
                if cards[index].idenifier == cards[matchedIndex].idenifier{
                    cards[index].isMatched = true
                    cards[matchedIndex].isMatched = true
                }
                cards[index].isFaceUP = true
                indexOfOneAndOnlyFaceUPCard = nil
                
            }
            
        }else{
            for index in cards.indices{
                cards[index].isFaceUP = false
            }
            cards[index].isFaceUP = true
            indexOfOneAndOnlyFaceUPCard = index
            
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
