//
//  Insider.swift
//  Insider
//
//  Created by José Ramón Ortiz Castañeda on 28/03/24.
//


import Foundation

struct Rule: Identifiable {
    var id = UUID()
    var image: String
    var phaseNumber: String
    var phaseTitle : String
    var intruction: String
    var imageName: String
    
}

let gameRules = [
    Rule(image: "Rule01",phaseNumber: "Phase One", phaseTitle: "Distribution of Roles", intruction: "Each player must slide the tab with their name to reveal their role, which can be Master, Insider or Common. If your role is Master, you must show your card to all participants, this rule only applies to this role. Once the card is revealed, you must hide it with the button that says 'hide it' and pass the cell phone to the player on the screen", imageName: "PhaseOne"),
    Rule(image:  "Rule01",phaseNumber: "Phase Two", phaseTitle: "Determine Theme", intruction: "Each player must slide the tab with their name to reveal their role, which can be Master, Insider or Common. If your role is Master, you must show your card to all participants, this rule only applies to this role. Once the card is revealed, you must hide it with the button that says 'hide it' and pass the cell phone to the player on the screen", imageName: "PhaseOne"),
    Rule(image:  "Rule01",phaseNumber: "Phase Three", phaseTitle: "Questions and Answers", intruction: "Each player must slide the tab with their name to reveal their role, which can be Master, Insider or Common. If your role is Master, you must show your card to all participants, this rule only applies to this role. Once the card is revealed, you must hide it with the button that says 'hide it' and pass the cell phone to the player on the screen", imageName: "PhaseOne"),
    Rule(image:  "Rule01",phaseNumber: "Phase Four", phaseTitle: "Discuss", intruction: "Each player must slide the tab with their name to reveal their role, which can be Master, Insider or Common. If your role is Master, you must show your card to all participants, this rule only applies to this role. Once the card is revealed, you must hide it with the button that says 'hide it' and pass the cell phone to the player on the screen", imageName: "PhaseOne"),
    Rule(image:  "Rule01",phaseNumber: "Phase Five", phaseTitle: "Judging Who Agreed", intruction: "Each player must slide the tab with their name to reveal their role, which can be Master, Insider or Common. If your role is Master, you must show your card to all participants, this rule only applies to this role. Once the card is revealed, you must hide it with the button that says 'hide it' and pass the cell phone to the player on the screen", imageName: "PhaseOne"),
    Rule(image:  "Rule01",phaseNumber: "Phase Six", phaseTitle: "Vote", intruction: "Each player must slide the tab with their name to reveal their role, which can be Master, Insider or Common. If your role is Master, you must show your card to all participants, this rule only applies to this role. Once the card is revealed, you must hide it with the button that says 'hide it' and pass the cell phone to the player on the screen", imageName: "PhaseOne")

]
