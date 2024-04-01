//
//  Insider.swift
//  Insider
//
//  Created by José Ramón Ortiz Castañeda on 26/03/24.
//

import Foundation

class Game {
    
    var players: [Player] = []
    var noPlayers: Int = 0
    var masterIndex : Int = -1
    var insiderIndex : Int = -1
    
    var wordIndex: Int = 0 // Actual word
    var wordCardIndex : Int = 0 // Actual word card
    
    init() {
        self.wordIndex = Int.random(in: 1...5)
        self.wordCardIndex = Int.random(in: 0..<testCards.count)
    }
    
    static var shared: Game = {
        let instance = Game()
        return instance
    }()
    
    func getMasterPlayer() -> Player{
        return players[masterIndex]
    }

    
    func distributionOfRoles(){
        
        self.noPlayers = players.count
        self.insiderIndex = Int.random(in: 0..<noPlayers)
        self.masterIndex = Int.random(in: 0..<noPlayers)

        while masterIndex == insiderIndex { // Must be different from the orginal
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

