//
//  ShowRole.swift
//  Insider
//
//  Created by José Ramón Ortiz Castañeda on 26/03/24.
//

import SwiftUI

struct UnlockView: View {
    
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
                        // Role card
                        VStack(spacing: 100) {
                            Text(players[actualPlayer].name)
                                .font(.system(size: 40, weight: .heavy, design: .default))
                                .foregroundColor( .white)
                                .frame(minWidth: 270)
                                .padding(.top, 30)
                            
                            Image(systemName: playersCards[players[actualPlayer].role]!.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 150, height: 150, alignment: .center)
                                .foregroundColor(.white)
                            
                            VStack(){
                                Text((playersCards[players[actualPlayer].role]?.role.0)!)
                                    .font(.system(size: 40, weight: .heavy, design: .default))
                                    .foregroundColor( .white)
                                
                                Text((playersCards[players[actualPlayer].role]?.role.1)!)
                                    .font(.system(size: 25, weight: .heavy, design: .default))
                                    .foregroundColor( .white)
                                    .italic()
                                    .padding()
                            }
                            .padding(.bottom, 30)
                        }
                        .background(Color.black)
                        .cornerRadius(10)
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        
                        if((playersCards[players[actualPlayer].role]?.role.0)! == "MASTER"){
                            Text("Show this card to everyone")
                                .font(.system(size: 20, weight: .heavy))
                                .padding(.top, 20)
                        }
                   
                        // Indication and hide button
                        VStack {
                            if isButtonVisible {
                                Button(action: {
                                    isLocked = true
                                    isButtonVisible = false
                                    actualPlayer += 1
                                }) {
                                    Text("Got it, hide it")
                                        .font(.system(size: 20, weight: .heavy))
                                        .frame(minWidth: 0, maxWidth: 240)
                                        .padding()
                                        .background(Color.black)
                                        .foregroundColor(.white)
                                        .cornerRadius(10)
                                    
                                }
                                .transition(.opacity)
                                .padding(.bottom)
                            }
                        }
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                                withAnimation {
                                    isButtonVisible = true
                                }
                            }
                        }
                        
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
    UnlockView(players: testPlayers)
}
