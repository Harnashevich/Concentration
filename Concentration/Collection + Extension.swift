//
//  Collection + Extension.swift
//  Concentration
//
//  Created by Andrei Harnashevich on 27.06.23.
//

import Foundation

extension Collection {
    
    var oneAndOnly: Element? {
        return count == 1 ? first : nil
    }
}

