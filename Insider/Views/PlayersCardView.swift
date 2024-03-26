//
//  PlayersCardView.swift
//  Insider
//
//  Created by José Ramón Ortiz Castañeda on 25/03/24.
//

import SwiftUI

struct PlayersCardView: View {
    @State private var isButtonVisible = false

    var actualPlayer: Player
    

    var body: some View {
        VStack(spacing: 100) {
            Text(actualPlayer.name)
                .font(.system(size: 40, weight: .heavy, design: .default))
                .foregroundColor( .white)
                .frame(minWidth: 270)
                .padding(.top, 30)

            Image(systemName: playersCards[actualPlayer.role]!.image)
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150, alignment: .center)
                .foregroundColor(.white)
               
            VStack(){
                Text((playersCards[actualPlayer.role]?.role.0)!)
                    .font(.system(size: 40, weight: .heavy, design: .default))
                    .foregroundColor( .white)
               
                Text((playersCards[actualPlayer.role]?.role.0)!)
                    .font(.system(size: 25, weight: .heavy, design: .default))
                    .foregroundColor( .white)
                    .italic()
                    .padding()
            }
            .padding(.bottom, 30)

        }
        .background(Color.black)
        .cornerRadius(10)
        .frame(minWidth: 300, minHeight: 110)
        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
        
        
        VStack {
                   if isButtonVisible {
                       Button(action: {}) {
                           Text("Got it")
                               .font(.system(size: 20, weight: .heavy, design: .default))
                               .frame(minWidth: 0, maxWidth: 240)
                               .padding()
                               .background(Color.black)
                               .foregroundColor(.white)
                               .cornerRadius(10)
                       }
                       .transition(.opacity)
                       .animation(.easeInOut(duration: 0.5))
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

#Preview("Insider"){
    PlayersCardView(actualPlayer: players[0])
}


