//
//  WordsCard.swift
//  Insider
//
//  Created by José Ramón Ortiz Castañeda on 25/03/24.
//

import Foundation

struct WordsCard: Identifiable {
    var id = UUID()
    var words: [(String, String)]
  
}

let gameCards = [WordsCard(words: [("Uno","/'u no/"),("Dos","/dos/"),("Tres","/tres/"),("Cuatro","/'kwa tro/"),("Cinco","/'θiŋ ko/"),("Seis","/'se js/")])]
