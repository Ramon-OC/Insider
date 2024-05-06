//
//  JudgingView.swift
//  Insider
//
//  Created by José Ramón Ortiz Castañeda on 02/04/24.
//

import SwiftUI

struct JudgingView: View {
    @State private var confetti = 0

    
    @State private var isButtonVisible = false
    
    @State private var firstQuestion = false
    @State private var firstQuestionAnswer = false
    
    @State private var secondtQuestion = false
    @State private var secondQuestionAnswer: Int = -1


    var body: some View {
        NavigationView {
            if(firstQuestion){
                VStack(spacing: 80) {
                    VStack(alignment: .leading){
                            Text("Judging Who Agreed")
                                .padding()
                                .multilineTextAlignment(.leading)
                                .font(.custom("Helvetica", size: 60))
                                .foregroundColor( .white)
                            Text("Players should raise their hands if they believe that the player who succeeded in the subject is the insider. The judge also votes.")
                                .padding()
                                .multilineTextAlignment(.leading)
                                .font(.custom("Helvetica", size: 20))
                                .foregroundColor( .white)
                        }
                    
                    VStack{
                        if(isButtonVisible){
                            Image(systemName: "hand.raised.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60, height: 60, alignment: .center)
                                .foregroundColor(.white)
                            Text("Raised hands are the majority?")
                                .padding()
                                .multilineTextAlignment(.leading)
                                .font(.custom("Helvetica", size: 25))
                                .foregroundColor( .white)
                            HStack {
                                Button(action: {
                                    firstQuestion = true
                                    firstQuestionAnswer = true
                                }, label: {
                                    Text("Yes")
                                        .font(.custom("Helvetica", size: 20))
                                        .frame(minWidth: 0, maxWidth: 120)
                                        .padding()
                                        .background(Color.white)
                                        .foregroundColor(.black)
                                        .cornerRadius(10)
                                })
                                Button(action: {
                                    firstQuestion = true
                                }, label: {
                                    Text("No")
                                        .font(.custom("Helvetica", size: 20))
                                        .frame(minWidth: 0, maxWidth: 120)
                                        .padding()
                                        .background(Color.white)
                                        .foregroundColor(.black)
                                        .cornerRadius(10)
                                })
                            }
                        }
                    }
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                            withAnimation(.easeInOut(duration: 0.5)) {
                                isButtonVisible = true
                            }
                        }
                    }
                }
                .containerRelativeFrame([.horizontal, .vertical])
                .background(Color.black )
                .frame(height: 50)
                .padding()
            }else{
                VStack{
                    
                    if(!secondtQuestion || secondQuestionAnswer == 0 ){
                        
                        Button(action: {
                            secondQuestionAnswer = 0
                            secondtQuestion.toggle()
                        }, label: {
                            VStack{
                                Image(systemName: playersCards["INSIDER"]!.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 120, height: 120, alignment: .center)
                                    .foregroundColor(.black)
                                    .padding(.top, 60)
                                Text("Was an Insider?")
                                    .font(.custom("Helvetica", size: 30))
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    .padding()
                                    .foregroundColor(.black)
                            }
                            .background(Color.white)
                        })
                        .transition(.opacity)
                    }
                    if(!secondtQuestion || secondQuestionAnswer == 1 ){
                        Button(action: {
                            secondQuestionAnswer = 1
                            secondtQuestion.toggle()
                            confetti += 1
                        }, label: {
                            VStack{
                                if(secondQuestionAnswer == 1 && secondtQuestion){
                                    Text(firstQuestionAnswer ? "The judge and commons win" : "The insider wins")
                                        .font(.custom("Helvetica", size: 30))
                                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                                        .padding()
                                        .foregroundColor(.white)
                                }else{
                                    Text("Was a Common?")
                                        .font(.custom("Helvetica", size: 30))
                                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                                        .padding()
                                        .foregroundColor(.white)
                                }
                                Image(systemName: playersCards["COMMONS"]!.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 120, height: 120, alignment: .center)
                                    .foregroundColor(.white)
                                    .padding(.bottom, 60)

                            }
                            .background(Color.black)
                        })
                        .transition(.opacity)
                    }
                }
            }
            
        }
        .confettiCannon(counter: $confetti, confettis:
                            [.sfSymbol(symbolName: "eye.fill"),
                            .sfSymbol(symbolName: "questionmark"),
                            .sfSymbol(symbolName: "exclamationmark")],
                        colors: [.white], confettiSize: 30.0, rainHeight: 1000.0,  radius: 500.0)
    }
}

#Preview {
    JudgingView()
}
