//
//  Card.swift
//  Concentration
//
//  Created by AN21581 on 09/07/2020.
//  Copyright © 2020 VGBNDGRL. All rights reserved.
//

import Foundation

//Notes: structs are value type and do not have inheritence. A value type gets copied, why is that important? Lots of things are structs in swift
//This is UI independent, this is the Model!

struct Card {
    
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0
    
    //static function, sort of a global/utility func, I can't send this to a Card
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
 
