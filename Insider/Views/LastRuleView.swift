//
//  LastRuleView.swift
//  Insider
//
//  Created by José Ramón Ortiz Castañeda on 28/03/24.
//

import SwiftUI

struct LastRuleView: View {
    var body: some View {
        VStack(spacing: 14) {
            CrookedText(text: "Congratulations", radius: 100) .font(.custom("Helvetica", size: 20))
                .frame(width: 100)
                .padding(.top, 230)
                .frame(height: 50)

            Image("MainLogo")
                .resizable()
                .scaledToFit()
                .frame(height: 100)
            
            Text("You are ready to play")
                .font(.custom("Helvetica", size: 20))
            
        }
        .background(Color.white)
        .frame(maxWidth: 300, maxHeight: 600)
    }
}

#Preview {
    LastRuleView()
}
