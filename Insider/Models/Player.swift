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

let testPlayers = [Player(name: "Player One", role: "MASTER"),
                   Player(name: "Player Two", role: "INSIDER"),
                   Player(name: "Player Three", role: "COMMONS"),
                   Player(name: "Player Four", role: "COMMONS")]

