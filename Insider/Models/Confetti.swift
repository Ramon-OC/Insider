//
//  Confetti.swift
//  Insider
//
//  Created by José Ramón Ortiz Castañeda on 28/03/24.
//

import SwiftUI
import ConfettiSwiftUI

struct Confetti: View {

        @State private var counter = 0
     
        var body: some View {
            Button(action: {
                counter += 1
            }) {
                Text("🎃")
                    .font(.system(size: 50))

            }
     
        }
    
}

#Preview {
    Confetti()
}
