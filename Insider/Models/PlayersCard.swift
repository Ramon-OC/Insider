//
//  PlayersCard.swift
//  Insider
//
//  Created by José Ramón Ortiz Castañeda on 25/03/24.
//

import Foundation
import UIKit

struct PlayersCard: Identifiable {
    var id = UUID()
    var role: (String, String)
    var image = String()
}

let playersCards =
    ["INSIDER": PlayersCard(role: ("INSIDER", "ɪnˈsaɪdər"), image: "eye.fill"),
     "MASTER": PlayersCard(role: ("MASTER", "ˈmastər"), image: "exclamationmark"),
     "COMMONS": PlayersCard(role: ("COMMONS", "ˈkämənz"), image: "questionmark")]
