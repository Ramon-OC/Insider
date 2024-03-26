//
//  WelcomeScreeenView.swift
//  Insider
//
//  Created by José Ramón Ortiz Castañeda on 25/03/24.
//

import SwiftUI

struct WelcomeScreenView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                Text("WELCOME\nTO")
                    .fontWeight(.heavy)
                    .font(.custom("Helvetica", size: 60))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                    .padding(.top, 70)

                    NavigationLink(
                        destination: PlayersInputView().navigationBarHidden(true),
                        label: {
                            Image("MainLogo")
                                   .resizable()
                                   .scaledToFit()
                                   .frame(width: 200, height: 250)
                            
                    })
                    
                    Text("INSIDER")
                        .fontWeight(.heavy)
                        .font(.custom("Helvetica", size: 60))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black)
                    
                    HStack {
                        Text("New around here? ")
                            .foregroundColor(Color(.white))
                        Text("Go to rules")
                            .foregroundColor(Color(.black))
                    }
                    .padding(.top, 50)

                }
            
            .containerRelativeFrame([.horizontal, .vertical])
            .background(Color("InsiderRed"))

        }
    }
}

struct WelcomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScreenView()
    }
}

