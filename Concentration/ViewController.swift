//
//  ViewController.swift
//  Concentration
//
//  Created by AN21581 on 07/07/2020.
//  Copyright © 2020 VGBNDGRL. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //we have to completely initialize something before we can access any of its vars and funcs
    // lazy var - no one can use game without initializing it first
    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count / 2) )
    
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("Card not found.")
        }
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 0) : #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
            }
        }
    }
    
    var emojiChoices = ["👻", "🎃", "🦇", "👹", "🍬", "💀"]
    
    //here we use a dictionary, remember this is like a hashtable, but it is a generic type that takes in a Key, Val. In this example our Key == UniqueIdentifier and Val == Emoji
    var emoji = [Int:String]()
    
    func emoji(for card: Card) -> String {
        //here we have back2back if statements, so we combined them using a comma
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int( arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        
        //one way of dealing with optionals is the following, ecause we check to make sure that it is not nil first
        if emoji[card.identifier] != nil {
            return emoji[card.identifier]!
        } else {
            return "?"
        }
        
        //this optional block of code can also be written as:
        //        return emoji[card.identifier] ?? "?"
    }
    
}

