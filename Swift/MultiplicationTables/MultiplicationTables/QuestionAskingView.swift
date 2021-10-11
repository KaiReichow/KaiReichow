//
//  QuestionAskingView.swift
//  MultiplicationTables
//
//  Created by Kai Reichow on 9/18/21.
//

import SwiftUI

struct QuestionAskingView: View {
    @StateObject private var viewModel = GameViewModel()

    
    var numberPad = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @State var numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12].shuffled()
    @State private var counterNumberPad = 0
    @State private var counter = 0
    @State var questionAmount: Int
    @State var multiplicationTableSelection: Int
    @State private var correctAnswer = 0
    @State private var tableNumber1 = ""
    @State private var tableNumber2 = ""
    @State private var userEnteredNumber = ""
    @State private var usedMultiplicationNumbers = [Int]()
    @State private var endGame = false
    @State var resultsArray: [(userScore: Int, correctScore: Int, num1: Int, num2: Int, correct: Bool)] = []
    
    var body: some View {
        ZStack {
            AppBackground()
            
            NavigationLink(
                destination: ResultsView(resultsArray: resultsArray),
                isActive: $endGame,
                label: {
                    EmptyView()
                })

            VStack(spacing: 30) {

                HStack {
                    Text(tableNumber1)
                        .modifier(StylizedButton(width: 140, height: 80, textSize: 80))
                    
                    SFSymbolDesign(sfSymbolName: "multiply", fontSize: 80)

                    Text(tableNumber2)
                        .modifier(StylizedButton(width: 140, height: 80, textSize: 80))

                }
                HStack {
                    SFSymbolDesign(sfSymbolName: "equal", fontSize: 80)
                    
                    
                    Text(userEnteredNumber)
                        .modifier(StylizedButton(width: 160, height: 80, textSize: 80))

                }
                ForEach(0..<3) { col in
                    HStack {
                        ForEach(0..<3) { row in
                            VStack {
                                
                                Button(action: {
                                    selectNumber(number: determinPosition(col: col, row: row) + 1 )
                                }, label: {
                                    Text("\(numberPad[determinPosition(col: col, row: row)])")
                                        .modifier(StylizedButton(width: 80, height: 80, textSize: 80))
                                })
                                
                            }
                        }
                    }
                }
                HStack {
                    Button(action: {
                        removeLastNumber()
                    }, label: {
                        SFSymbolDesign(sfSymbolName: "arrowshape.turn.up.left", fontSize: 80)
                    })
                
                    Button(action: {
                        selectNumber(number: 0)
                    }, label: {
                        Text("0")
                            .modifier(StylizedButton(width: 80, height: 80, textSize: 80))
                    })
                    
                    Button(action: {
                        if !infoFilledIn() {
                            return
                        }
                        saveScore()
                        gameOver()
                        resetQuestion()
                        generateQuestions()
                        
                        
                    }, label: {
                        SFSymbolDesign(sfSymbolName: "checkmark", fontSize: 80)
                    })
                }
            }
        }.onAppear(perform: {
            generateQuestions()
        })
    }
    func determinPosition(col: Int, row: Int) -> Int {
        var result = 0
        
        if col == 0 {
            result = row
        }
        if col == 1 {
            result = row + 3
        }
        if col == 2 {
            result = row + 6
        }
        return result
    }
    func selectNumber(number: Int) {
        userEnteredNumber.append(String(number))
    }
    func removeLastNumber() {
        userEnteredNumber.popLast()
    }
    // sets the number 2 to a random int of the multiplication table and sets correct answers value
    func generateQuestions() {
            tableNumber1 = String(multiplicationTableSelection)
            tableNumber2 = String(generateUniqueNumber())
            correctAnswer = (multiplicationTableSelection * Int(tableNumber2)!)
    }
    //gets number to multiply for times tabes
    func generateUniqueNumber() -> Int {
        var tempInt: Int = -1
        
        // Checks if first element of the array
        if (usedMultiplicationNumbers.isEmpty) {
            tempInt = numbers[0]
            numbers.remove(at: 0)
            usedMultiplicationNumbers.append(tempInt)
        }
        if(!usedMultiplicationNumbers.isEmpty) {
            tempInt = numbers[0]
            numbers.remove(at: 0)
            usedMultiplicationNumbers.append(tempInt)
        }
        self.counter += 1
        return tempInt
    }
    func saveScore() {
        if counter > questionAmount {
            return
        }
        resultsArray.append((userScore: Int(userEnteredNumber)!, correctScore: correctAnswer, num1: Int(tableNumber1)!, num2: Int(tableNumber2)!, correct: checkAnswer()))
    }
    func checkAnswer() -> Bool {
        return Int(userEnteredNumber) == correctAnswer
    }
    func resetQuestion() {
            userEnteredNumber = ""
    }
    func gameOver() {
        if (counter == questionAmount) {
            self.endGame = true
        }
    }
    func infoFilledIn() -> Bool {
        let userNumber = Int(userEnteredNumber) ?? -1
        if userNumber == -1 {
            return false
        }
        return true
    }
}
struct QuestionAskingView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionAskingView(questionAmount: 1, multiplicationTableSelection: 1)
    }
}
