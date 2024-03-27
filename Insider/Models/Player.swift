//
//  Player.swift
//  Insider
//
//  Created by José Ramón Ortiz Castañeda on 25/03/24.
//

import Foundation

class Player {
    var name: String = ""
    var role: String = ""
    
    init(name: String, role: String) {
          self.name = name
          self.role = role
      }
}

let testPlayers = [Player(name: "José", role: "MASTER"),
                   Player(name: "Ramón", role: "INSIDER"),
                   Player(name: "Ortiz", role: "COMMONS"),
                   Player(name: "Castañeda", role: "COMMONS")]

