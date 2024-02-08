//
//  ViewController.swift
//  Assignment 5
//
//  Created by Owner on 2/8/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var adventureTitleLabel: UILabel!
    @IBOutlet weak var option1Button: UIButton!
    @IBOutlet weak var option2Button: UIButton!
    @IBOutlet weak var startOverButton: UIButton!
    
    let adventureManager = AdventureManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Load initial adventure
        let adventure = Adventure(title: "You stumble upon an old cottage deep in the woods. What do you do?", options: ["Knock on the door", "Peep in the window"], outcomes: ["Knock on the door": false, "Peep in the window": true])
        adventureManager.startAdventure(adventure: adventure)
        updateUI()
    }
    
    func updateUI() {
        guard let adventure = adventureManager.currentAdventure else {
            return
        }
        adventureTitleLabel.text = adventure.title
        adventureTitleLabel.numberOfLines = 0 // Allow label to have multiple lines
        
        // Set button titles based on adventure options
        option1Button.setAttributedTitle(createBoldAttributedString(adventure.options[0]), for: .normal)
        option2Button.setAttributedTitle(createBoldAttributedString(adventure.options[1]), for: .normal)
        
        // Show both buttons
        option1Button.isHidden = false
        option2Button.isHidden = false
        
        // Hide start over button initially
        startOverButton.isHidden = true
    }
    
    @IBAction func optionSelected(_ sender: UIButton) {
        guard let index = sender == option1Button ? 0 : 1 else {
            return
        }
        if let outcome = adventureManager.makeChoice(choiceIndex: index) {
            if outcome {
                // Successful outcome
                if adventureTitleLabel.text == "You stumble upon an old cottage deep in the woods. What do you do?" {
                    adventureTitleLabel.text = "You see a haggard old witch making stew. Do you want to see what she's cooking?"
                    option1Button.setAttributedTitle(createBoldAttributedString("Continue watching"), for: .normal)
                    option2Button.setAttributedTitle(createBoldAttributedString("Run away"), for: .normal)
                } else {
                    adventureTitleLabel.text = "Success: You made the smart decision."
                    option1Button.isHidden = true
                    option2Button.isHidden = true
                    showStartOverButton() // Show start over button on success
                }
            } else {
                // Unsuccessful outcome
                if adventureTitleLabel.text == "You stumble upon an old cottage deep in the woods. What do you do?" {
                    adventureTitleLabel.text = "A beautiful woman answers the door and invites you in for dinner."
                    option1Button.setAttributedTitle(createBoldAttributedString("Accept"), for: .normal)
                    option2Button.setAttributedTitle(createBoldAttributedString("Decline"), for: .normal)
                } else {
                    adventureTitleLabel.text = "Adventure Failed: You have been kidnapped by the witch and eaten."
                    option1Button.isHidden = true
                    option2Button.isHidden = true
                    showStartOverButton() // Show start over button on failure
                }
            }
        }
    }
    
    @IBAction func startOver(_ sender: UIButton) {
        let adventure = Adventure(title: "You stumble upon an old cottage deep in the woods. What do you do?", options: ["Knock on the door", "Peep in the window"], outcomes: ["Knock on the door": false, "Peep in the window": true])
        adventureManager.startAdventure(adventure: adventure)
        updateUI()
    }
    
    func createBoldAttributedString(_ text: String) -> NSAttributedString {
        let attrs: [NSAttributedString.Key: Any] = [.font: UIFont.boldSystemFont(ofSize: 17)]
        return NSAttributedString(string: text, attributes: attrs)
    }
    
    func showStartOverButton() {
        startOverButton.isHidden = false // Show start over button
    }
}


