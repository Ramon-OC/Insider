//
//  ContentView.swift
//  TriggerSliderExample
//
//  Created by Dominik Butz on 6/11/2021.
//

import SwiftUI

struct UnlockView: View {
    
    @State private var isLocked = true
    @State private var isLoading = false
    var playersName: String

    var body: some View {
        VStack(spacing: 80) {
            
            VStack(alignment: .leading){
                Text("Hello,\n"+playersName+"!")
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
            
                if(isLocked){
                    GeometryReader { geometry in
                        ZStack(alignment: .leading) {
                            BackgroundComponent()
                            DraggingComponent(isLocked: $isLocked, isLoading: isLoading, maxWidth: geometry.size.width)
                        }
                    }
                    .frame(height: 50)
                    .padding()
                    .onChange(of: isLocked) { isLocked in
                        guard !isLocked else { return }
                    }
                }
        }
        .containerRelativeFrame([.horizontal, .vertical])
        .background(Color.black)
    }
}

#Preview("Insider"){
    UnlockView(playersName: "Ramón")
}
