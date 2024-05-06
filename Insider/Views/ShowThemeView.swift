//
//  ShowThemeView.swift
//  Insider
//
//  Created by José Ramón Ortiz Castañeda on 27/03/24.
//

import SwiftUI

struct ShowThemeView: View {
    
        var masterName : String = Game.shared.getMasterPlayer().name
        
        var words: [(String,String)] = gameCards[Game.shared.wordCardIndex].words
        var actualWordIndex: Int = Game.shared.wordIndex
        @State private var isButtonVisible = false
        @State private var isLocked = true
        @State private var isLoading = false
                
        var body: some View {
            NavigationView {
                VStack(spacing: 80) {
                    if(isLocked){
                        VStack(alignment: .leading){
                            Text("Hello,\n"+masterName+"!")
                                .padding()
                                .multilineTextAlignment(.leading)
                                .font(.custom("Helvetica", size: 60))
                                .foregroundColor( .white)
                            
                            Text("As a master role in the game, when you slide the bar you will see the game word highlighted in red. When you finish, everyone closes their eyes (including you) and you leave your cell phone on the table. You will give the instruction to the insider to open his eyes and everyone counts from five to cero. The master will hide the word")
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
                        
                    }else{ // Show game word
                        VStack{
                            HStack{
                                Text("Word of the round: ")
                                    .font(.custom("Helvetica", size: 30))
                                Text(String(actualWordIndex))
                                    .foregroundColor(.red)
                                    .font(.custom("Helvetica", size: 30))
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
                            
                            // Add move to next face button
                            Button(action: {
                                // Send SMSs to all players!
                                
                            }) {
                                Text("Got it, send it to Insider")
                                    .font(.system(size: 20, weight: .heavy))
                                    .frame(minWidth: 0, maxWidth: 240)
                                    .padding()
                                    .background(Color.black)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                                
                            }
                            .transition(.opacity)
                            .padding()
                            
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
    ShowThemeView(masterName:"Master Player", words: gameCards[0].words, actualWordIndex:  1)
}
