//
//  Card.swift
//  Concentration
//
//  Created by Andrei Harnashevich on 20.06.23.
//

import Foundation


struct Card {
    
     var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    private static var identifierFactory = 0
    
    private static func getUniqueIdentified() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentified()
    }
}
