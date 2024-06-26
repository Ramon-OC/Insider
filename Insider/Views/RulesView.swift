//
//  RulesView.swift
//  Insider
//
//  Created by José Ramón Ortiz Castañeda on 28/03/24.
//

import SwiftUI
import ConfettiSwiftUI


struct RulesView: View {
    
    @State private var currentRuleIndex = 0
    @GestureState private var dragOffset: CGFloat = 0
    @State private var confetti = 0

    var body: some View {
        NavigationView {
            
            ZStack {
                VStack(alignment: .leading) {
                    Text("Game Rules")
                        .font(.custom("Helvetica", size: 35))
                        .fontWeight(.black)
                    
                    Text("scroll right to see more")
                        .font(.custom("Helvetica", size: 20))
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
                .padding(.all)
                
                
                GeometryReader { outerView in
                    HStack(spacing: 0) {
                        ForEach(gameRules.indices, id: \.self) { index in
                            
                            RuleCardView(imageName: gameRules[index].image, phaseNumber: gameRules[index].phaseNumber, phaseTitle: gameRules[index].phaseTitle, intruction: gameRules[index].intruction)
                                .frame(width: outerView.size.width, height: self.currentRuleIndex == index ?  600 : 100)
                                                        
                        }
                            
                        LastRuleView() // Last view
                            .frame(width: outerView.size.width, height: 600 )
                            .confettiCannon(counter: $confetti, confettis:
                                                [.image("MainLogo"),
                                                .sfSymbol(symbolName: "questionmark"),
                                                .sfSymbol(symbolName: "exclamationmark")],
                                            colors: [.black], confettiSize: 30.0, rainHeight: 1000.0,  radius: 500.0)
                      
                    }
            
                    .frame(width: outerView.size.width, height: outerView.size.height, alignment: .leading)
                    .padding(.top, 30)
                    .offset(x: -CGFloat(self.currentRuleIndex) * outerView.size.width)
                    .offset(x: self.dragOffset)
                    .gesture(
                        DragGesture()
                            .updating(self.$dragOffset, body: { (value, state, transaction) in
                                state = value.translation.width
                            })
                        
                            .onEnded({ (value) in
                                let sensitivityFactor: CGFloat = 0.3
                                let threshold = outerView.size.width * sensitivityFactor
                                var newIndex = Int(-value.translation.width / threshold) + self.currentRuleIndex
//                                newIndex = min(max(newIndex, 0), gameRules.count - 1)
                                newIndex = min(max(newIndex, 0), gameRules.count)
                                
                                if(newIndex == gameRules.count){
                                    confetti+=1
                                }

                                self.currentRuleIndex = newIndex
                            })
                    )
                    .animation(.interpolatingSpring(.smooth), value: dragOffset)

                    
                }
            }
        }
    }
}

#Preview {
    RulesView()
}
