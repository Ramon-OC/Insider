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
    
    static var shared: Game = {
            let instance = Game()
            return instance
    }()

    
    func distributionOfRoles(){
        
        let noPlayers = players.count
        let insiderPlayer = Int.random(in: 0..<noPlayers)
        var masterPlayer = Int.random(in: 0..<noPlayers)

        while masterPlayer == insiderPlayer {
            masterPlayer = Int.random(in: 0..<noPlayers)
        }

        players[insiderPlayer].role = "INSIDER"
        players[masterPlayer].role = "MASTER"
        
        for player in players {
            print(player.name+" "+player.role)
        }
        
    }
}

