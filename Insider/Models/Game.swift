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

    
    
    func distributionOfRoles(playerNames: [NameInputItem]){
        
        for playerName in playerNames {
            players.append(Player(name: playerName.name, role: "COMMONS"))
        }
        
        var noPlayers = players.count

        var insiderPlayer = Int.random(in: 0..<noPlayers)
        var masterPlayer = Int.random(in: 0..<noPlayers)

        while masterPlayer == insiderPlayer {
            masterPlayer = Int.random(in: 0..<noPlayers)
        }

        print(insiderPlayer)
        print(masterPlayer)
        players[insiderPlayer].role = "INSIDER"
        players[masterPlayer].role = "MASTER"
        
        for player in players {
            print(player.name+" "+player.role)
        }
        
    }
}

