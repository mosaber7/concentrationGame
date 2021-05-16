//
//  Concetration.swift
//  Concetration
//
//  Created by Saber on 19/04/2021.
//

import Foundation


class Concetration {
   private(set) var cards = [Card]()
    
    private  var indexOfOneAndOnlyFaceUPCard: Int?{
        get{
            return cards.indices.filter{cards[$0].isFaceUP}.oneAndOnly
            
        }
        set{
            for index in cards.indices{
                cards[index].isFaceUP = (index == newValue)
            }
        }
    }
    
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
            
            else{
                
                indexOfOneAndOnlyFaceUPCard = index
            }
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

extension Collection{
    var oneAndOnly: Element?{
        count == 1 ? first : nil
    }
}
