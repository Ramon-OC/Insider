//
//  WordCard.swift
//  Insider
//
//  Created by José Ramón Ortiz Castañeda on 25/03/24.
//

import SwiftUI

struct WordsCardView: View {
    
    let words: [(String,String)] = gameCards[Game.shared.wordCardIndex].words
    let actualWordIndex: Int = Game.shared.wordIndex

    var body: some View {

        VStack{
            
            HStack{
                Text("Word of the round: ")
                    .font(.custom("Helvetica", size: 25))
                Text(String(actualWordIndex))
                    .foregroundColor(.red)
                    .font(.custom("Helvetica", size: 25))
            }
            .padding(.all)
            
            VStack(spacing: 15) {
                ForEach(words.indices, id: \.self) { index in
                    HStack {
                        Text("\(index + 1)")
                            .font(.system(size: 40, weight: .heavy, design: .default))
                            .foregroundColor(actualWordIndex == (index + 1) ? .red : .black)
                            .padding(.leading, 20)
                       
                        VStack{
                            Text(words[index].0)
                                .font(.system(size: 20, weight: .heavy, design: .default))
                                .foregroundColor(actualWordIndex == (index + 1) ? .red : .black)
                                .frame(maxWidth: .infinity, alignment: .trailing) // Alineación a la derecha
                            
                            Text(words[index].1)
                                .font(.system(size: 20, weight: .heavy, design: .default))
                                .foregroundColor(actualWordIndex == (index + 1) ? .red : .black)
                                .frame(maxWidth: .infinity, alignment: .trailing) // Alineación a la derecha
                        }
                        .padding(.trailing, 10)

                        Spacer() // Espacio para expandir la línea divisoria horizontal
                    }
                    .padding(.top, 10)
                    Divider() // Línea divisoria horizontal
                }
            }
            .background(Color.white)
            .cornerRadius(10)
            .frame(minWidth: 300, idealWidth: 300, maxWidth: 110, minHeight: 110)
            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
        }
    }
}


