//
//  Temp.swift
//  Insider
//
//  Created by José Ramón Ortiz Castañeda on 25/03/24.
//

import SwiftUI

struct TimerView: View {
    @State private var secondsPassed: TimeInterval = 0
    let duration: TimeInterval = 40 // Duración de un minuto en segundos
    @State private var timer: Timer?
    
    var body: some View {
        ZStack {
            Color.black
                .opacity(getOpacity())
                .edgesIgnoringSafeArea(.all)
            
            Text("\(Int(duration - secondsPassed))")
                .font(.largeTitle)
                .foregroundColor(.white)
        }
        .onAppear(perform: startTimer)
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            secondsPassed += 1
            
            // Detener el temporizador cuando se alcanza la duración
            if secondsPassed >= duration {
                timer?.invalidate()
                timer = nil
            }
        }
    }
    
    func getOpacity() -> Double {
        let progress = secondsPassed / duration
        return 1.0 - progress
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}


#Preview {
    TimerView()
}
