//
//  AdventureManager.swift
//  Assignment 5
//
//  Created by Owner on 2/8/24.
//

import Foundation

class AdventureManager {
    var currentAdventure: Adventure?
    
    func startAdventure(adventure: Adventure) {
        currentAdventure = adventure
    }
    
    func makeChoice(choiceIndex: Int) -> Bool? {
        guard let adventure = currentAdventure else {
            return nil // No adventure currently in progress
        }
        return adventure.resolveAdventure(choiceIndex: choiceIndex)
    }
}
