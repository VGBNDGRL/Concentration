//
//  Card.swift
//  Concentration
//
//  Created by AN21581 on 09/07/2020.
//  Copyright © 2020 VGBNDGRL. All rights reserved.
//

import Foundation
//This is UI independent, this is a Model!

/*
    - We are making this a struct, not a class
    - What is the difference? A struct and class in Swift are VERY similar.
        There are TWO major differences:
            1) Structs have NO inheritance (makes them simple)
            2) Structs are VALUE types, Classes are REFERENCE types
                - What does this mean? A VALUE type, when you pass it as an argument, put it in an array, assign it to another var, it gets COPIED
                - Copy-on-write semantics
                - Classes are REFERENCE types: Object lives in the HEAP, you pass pointers to the same object

 */
struct Card {
    /* What does a card need?*/
    var isFaceUp = false // start face down
    var isMatched = false // start off unmatched
    var identifier: Int // need a uinque ID to match cards
    
    static var identifierFactory = 0
    /* What is a static func? We ask the Card Type for an ID, this is like a global func*/
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    // We are creating an init so I don't always have to initialize all of the vars
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
    /* Does our card need an its emoji? NO becuase this is UI independent, we are only worried about how the card BEHAVES, how the game WORKS. MODEL NOT UI!*/
}
 
