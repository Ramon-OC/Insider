//
//  TripCardView.swift
//  SwiftUICarousel
//
//  Created by Simon Ng on 24/7/2023.
//

import SwiftUI

struct TripCardView: View {
    let imageName: String
    let phaseNumber: String
    let phaseTitle : String
    let intruction: String
        
    var body: some View {
        VStack(spacing: 14) {
            Text(self.phaseNumber)
                .padding(.top, 30)
                .font(.custom("Helvetica", size: 40))
                .fontWeight(.bold)
                .multilineTextAlignment(.trailing)
            
            Text(self.phaseTitle)
                .padding()
                .font(.custom("Helvetica", size: 20))
            
            Text(self.intruction)
                .padding(.all)
                .font(.custom("Helvetica", size: 15))
                .foregroundColor( .black)
            
            Image(self.imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 200)
                .padding(.horizontal)
            
        }
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 10)
        .frame(maxWidth: 300, maxHeight: 600)
    }
}

#Preview {
    TripCardView(imageName: gameRules[0].image, phaseNumber: gameRules[0].phaseNumber, phaseTitle: gameRules[0].phaseTitle, intruction: gameRules[0].intruction)
}
