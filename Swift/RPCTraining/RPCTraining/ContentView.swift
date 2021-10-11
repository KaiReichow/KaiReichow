//
//  ContentView.swift
//  RPCTraining
//
//  Created by Kai Reichow on 9/2/21.
//

import SwiftUI
struct appButton: ViewModifier {
    var color: Color
    
    func body(content: Content) -> some View {
        content
            .frame(width: 320, height: 80)
            .background(color)
            .foregroundColor(.white)
            .font(.system(size: 40, weight: .heavy, design: .default))
            .cornerRadius(16)
    }
}
extension View {
    func appButtonStyle(color: Color) -> some View {
        self.modifier(appButton(color: color))
    }
}
struct appLabel: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 150, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .background(Color.black)
            .foregroundColor(.white)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(16)
    }
}
extension View {
    func appLabelStyle() -> some View {
        self.modifier(appLabel())
    }
}

struct ContentView: View {
    @State private var rpsChoices = ["Rock", "Paper", "Scissors"].shuffled()
    private var winKeyDic = ["Rock": "Scissors", "Paper": "Rock", "Scissors": "Paper"]
    @State var colorArray: [Color] = [Color.red, Color.blue, Color.yellow, .green, .orange, .purple, .gray].shuffled()
    @State private var winCondition: Bool = Bool.random()
    @State private var playerChoice = ""
    @State private var playAgain = false
    @State private var score: Int = 0
    @State private var questionCount: Int = 0

    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.gray, Color.white]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack{
                Text("\(questionCount) of 5")
                    .appButtonStyle(color: .black)
                    .padding(10)
                VStack(){
                HStack(spacing: 32) {
                    Text("Choice: \(rpsChoices[0])")
                        .appLabelStyle()
                    
                    Text("\(winCondition ? "Goal: Win" : "Goal: Loose")")
                        .appLabelStyle()
                }
                .padding(10)
            }
                Spacer()
                VStack(spacing: 16){
                ForEach(0..<rpsChoices.count) {num in
                    Button(action: {
                        playerChoice = rpsChoices[num]
                        self.calculateWin()
                        self.shuffleTheStuff()
                        self.finalWin()
                    }, label: {
                        Text("\(self.rpsChoices[num])")
                            .appButtonStyle(color: colorArray[num])
                    })
                }
                }
                Spacer()
            }
        }
        .alert(isPresented: $playAgain, content: {
            Alert(title: Text("Your score is \(score)"), message: nil, dismissButton: .default(Text("Play again?"), action: {
                self.resetGame()

            }))
        })
    }
    func calculateWin(){
        questionCount += 1
        // if player choice beats cpu choice and goal is to win
        if (winKeyDic[playerChoice] == rpsChoices[0]) && winCondition {
            score += 1
            return
        }
        if (playerChoice == rpsChoices[0]) && winCondition {
            score -= 1
            return
        }
        if (playerChoice == rpsChoices[0]) && !winCondition {
            score -= 1
            return
        }
        // if player choice does not beat cpu choice and goal is to loose
        if (winKeyDic[playerChoice] != rpsChoices[0]) && !winCondition {
            score += 1
            return
        }
    }
    func shuffleTheStuff() {
        rpsChoices.shuffle()
        winCondition = Bool.random()
        colorArray.shuffle()
    }
    func finalWin() {
        if questionCount == 5 {
            playAgain = true
        }
    }
    func resetGame() {
        questionCount = 0
        score = 0
    }
    
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
