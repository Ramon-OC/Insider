//
//  ShowThemeView.swift
//  Insider
//
//  Created by José Ramón Ortiz Castañeda on 27/03/24.
//

import SwiftUI

struct ShowThemeView: View {

    
    let words: [(String,String)]
    let actualWordIndex: Int
        
        @State private var isButtonVisible = false
        @State private var isLocked = true
        @State private var isLoading = false
        
        var players: [Player] = Game.shared.players
        @State var actualPlayer: Int = 0
        
        var body: some View {
            NavigationView {
                VStack(spacing: 80) {
                    if(isLocked){
                        
                        VStack(alignment: .leading){
                            Text("Hello,\n"+players[actualPlayer].name+"!")
                                .padding()
                                .multilineTextAlignment(.leading)
                                .font(.custom("Helvetica", size: 60))
                                .foregroundColor( .white)
                            
                            Text("As you swipe down the bottom tab, your role in the game is revealed. Remember it discreetly, hide the information, and then pass the phone to the player indicated on the screen.")
                                .padding()
                                .multilineTextAlignment(.leading)
                                .font(.custom("Helvetica", size: 20))
                                .foregroundColor( .white)
                        }
                        
                        GeometryReader { geometry in
                            ZStack(alignment: .leading) {
                                BackgroundComponent()
                                DraggingComponent(isLocked: $isLocked, isLoading: isLoading, maxWidth: geometry.size.width)
                            }
                        }
                        .frame(height: 50)
                        .padding()
                        .onChange(of: isLocked) {
                            guard !isLocked else { return }
                    
                            
                        }
                        
                    }else{ // Show role elements
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
                                                .frame(maxWidth: .infinity, alignment: .trailing)
                                            
                                            Text(words[index].1)
                                                .font(.system(size: 20, weight: .heavy, design: .default))
                                                .foregroundColor(actualWordIndex == (index + 1) ? .red : .black)
                                                .frame(maxWidth: .infinity, alignment: .trailing) 
                                        }
                                        .padding(.trailing, 10)

                                        Spacer()
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
                .containerRelativeFrame([.horizontal, .vertical])
                .background(isLocked ? Color.black : Color.white)
                .transition(.opacity)
                .zIndex(1) /// here!
            }
        }
    }


#Preview("LockScrean"){
    ShowThemeView(words: testCards[0].words, actualWordIndex: 4, players: testPlayers)
}
