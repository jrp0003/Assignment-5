//
//  Adventure.swift
//  Assignment 5
//
//  Created by Owner on 2/8/24.
//

import Foundation

struct Adventure {
    let title: String
    let options: [String]
    let outcomes: [String: Bool] // Dictionary of outcomes mapped to success (true) or failure (false)
    
    func resolveAdventure(choiceIndex: Int) -> Bool? {
        guard choiceIndex >= 0 && choiceIndex < options.count else {
            return nil // Invalid choice index
        }
        let outcome = outcomes[options[choiceIndex]] // Retrieve outcome based on user's choice
        return outcome
    }
}
