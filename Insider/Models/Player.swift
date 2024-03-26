//
//  Player.swift
//  Insider
//
//  Created by José Ramón Ortiz Castañeda on 25/03/24.
//

import Foundation

struct Player: Identifiable {
    var id = UUID()
    var name: String = ""
    var role: String
}

let players = [Player(name: "Ramón", role: "INSIDER")]
