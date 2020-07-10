//
//  Concentration.swift
//  Concentration
//
//  Created by AN21581 on 09/07/2020.
//  Copyright © 2020 VGBNDGRL. All rights reserved.
//

import Foundation

//classes are reference types, we can have many pointers to this file
class Concentration {
    
    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                //either no cards or 2 cards are face up
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        //underbar is used as control var because we do not care for it
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card] // this is the same as appending to the array
            
            //            cards.append(card)
            //            cards.append(card) // different copy, when we passed structs around, we are copying them
        }
        // TODO: Shuffle the cards
    }
    
}
