//
//  Insider.swift
//  Insider
//
//  Created by José Ramón Ortiz Castañeda on 26/03/24.
//

import Foundation

class Game {
    
    var players: [Player] = []
    var wordIndex: Int = 0
    
    var noPlayers: Int = 0
    var masterIndex : Int = -1
    var insiderIndex : Int = -1
    
    static var shared: Game = {
        let instance = Game()
        return instance
    }()

    
    func distributionOfRoles(){
        
        self.noPlayers = players.count
        self.insiderIndex = Int.random(in: 0..<noPlayers)
        self.masterIndex = Int.random(in: 0..<noPlayers)

        while masterIndex == insiderIndex {
            masterIndex = Int.random(in: 0..<noPlayers)
        }
        
        // Try to improve this by only one call of distributionOfRoles() in view
        for player in players {
            player.role = "COMMONS"
        }

        players[insiderIndex].role = "INSIDER"
        players[masterIndex].role = "MASTER"
        
        for player in players {
            print(player.name+" "+player.role)
        }
        
    }
}

