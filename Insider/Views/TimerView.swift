//
//  Temp.swift
//  Insider
//
//  Created by José Ramón Ortiz Castañeda on 25/03/24.
//

import SwiftUI

struct TimerView: View {
    @State private var timeIsOver = false
    @State private var secondsPassed: TimeInterval = 0
    let duration: TimeInterval = 5 // Duración de un minuto en segundos
    @State private var timer: Timer?
    
    
    var body: some View {
        
        ZStack {
            Color.black
                .opacity(getOpacity())
                .edgesIgnoringSafeArea(.all)
            
            HStack{
                Text("\(Int(duration - secondsPassed))")
                    .font(.custom("Helvetica", size: 90))
                    .foregroundColor(Color(white: getOpacity()))
                
                Text("seg")
                    .font(.custom("Helvetica", size: 30))
                    .foregroundColor(Color(white: getOpacity()))
            }
            
            VStack {
                if(timeIsOver){
                    Text("Time is Over")
                        .font(.custom("Helvetica", size: 30))
                        .foregroundColor(Color(.black))
                    
                    NavigationLink(
                        destination: JudgingView().navigationBarHidden(false),
                        label: {
                            Text("Go to Phase Five")
                                .font(.custom("Helvetica", size: 20))
                                .foregroundColor(Color("InsiderRed"))

                        }
                    )
                }
            }
            .animation(.easeInOut(duration: 0.5), value: timeIsOver)
            .padding(.top, 300)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    withAnimation(.easeInOut(duration: 2)) {
                        timeIsOver = true
                    }
                }
            }

            
            

        }
        .onAppear(perform: startTimer)
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            secondsPassed += 1
            
            if(Int(duration - secondsPassed) == 0){
                timeIsOver.toggle()
            }
            
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
