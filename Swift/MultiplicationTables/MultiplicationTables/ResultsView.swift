//
//  ResultsView.swift
//  MultiplicationTables
//
//  Created by Kai Reichow on 9/21/21.
//

import SwiftUI

struct ResultsView: View {
    @State var animationAmount: CGFloat = 1
    @State var resultsArray: [(userScore: Int, correctScore: Int, num1: Int, num2: Int, correct: Bool)]
    
    var body: some View {
        ZStack {
            AppBackground()
            
            ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: false) {
                NavigationLink(
                    destination: StartMenu(),
                    label: {
                        Text("Play again?")
                            .modifier(StylizedButton(width: 320, height: 80, textSize: 50))
                    })
                    .isDetailLink(false)
                .padding(10)
                
                ForEach(0..<resultsArray.count) { number in
                    
                    VStack(spacing: 10){
                    HStack(spacing: 5) {
                        
                        Text("\(resultsArray[number].num1)")
                            .modifier(StylizedButton(width: 80, height: 60, textSize: 30))
                        
                        SFSymbolDesign(sfSymbolName: "multiply", fontSize: 30)

                        Text("\(resultsArray[number].num2)")
                            .modifier(StylizedButton(width: 80, height: 60, textSize: 30))
                        
                        SFSymbolDesign(sfSymbolName: "equal", fontSize: 30)

                        Text("\(resultsArray[number].userScore)")
                            .modifier(StylizedButton(width: 80, height: 60, textSize: 30))
                    }
                    
                    HStack(spacing: 5) {
                        
                        NavigationLink(
                            destination: InvestigateView(num1: resultsArray[number].num1, num2: resultsArray[number].num2),
                            label: {
                                Text("Investigate?")
                                    .modifier(StylizedButton(width: 250, height: 60, textSize: 30))
                            })
                        
                        Image(systemName: resultsArray[number].correct ? "checkmark" : "xmark")
                            .imageScale(.large)
                            .padding(10)
                            .background(Color.white)
                            .clipShape(Circle())
                            .foregroundColor(resultsArray[number].correct ? .green : .red)
                            .font(.system(size: 30))
                            .overlay(
                                Circle()
                                    .stroke(resultsArray[number].correct ? Color.white : Color.red)
                                    .scaleEffect(animationAmount)
                                    .opacity(Double(2 - animationAmount))
                                    .animation(Animation.easeOut(duration: 1).repeatForever(autoreverses: false))
                                    .onAppear() {
                                        //DispatchQueue.main.async {
                                            self.animationAmount = 2
                                        //}
                                    }
                            )
                    }
                    }
                    Spacer(minLength: 30)
                }
            }
        }
        .navigationBarHidden(true)
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView(resultsArray: [(userScore: 20, correctScore: 20, num1: 5, num2: 4, correct: true)])
    }
}
