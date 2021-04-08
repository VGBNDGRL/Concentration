//
//  Concentration.swift
//  Concentration
//
//  Created by AN21581 on 09/07/2020.
//  Copyright © 2020 VGBNDGRL. All rights reserved.
//

/* notice there is no UIKit, just Foundation, because again, Models are UI independent */
import Foundation

/* Whenever we build classes think about its public API*/
/* What is an API? Application Programming Interface
 - A list of all the methods and instace variables in the class
 - A PUBLIC API is all the instance vars and methods you will allow the public(other classes) to call/use
 - Basically HOW you USE the class
 */

/* What are the essentials of what this class does, what does my game do? */
class Concentration {
    // We need to define a 'card'
    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int) {
        if  !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    
    init(numberOfPairsOfCards: Int) {
        // underbar in Swift means we don't care to give it a name, becuase we won't use it later
        for _ in 0..<numberOfPairsOfCards {
            /* A card is a Struct, they get free initializers, and their free init initializes all of their vars. Classes do not get this free init. */
            /* I do not want to  initialize these when creating an instance of Card, so I will ceate an init in that respective struct*/
            let card = Card()
            cards += [card,card] // same thing as two following lines:
            //            cards.append(card)
            //            cards.append(card) // these are TWO DIFFERENT cards
        }
        // TODO: Shuffle the cards
        
    }
}
