//
//  GameViewModel.swift
//  MultiplicationTables
//
//  Created by Kai Reichow on 9/22/21.
//

import SwiftUI
// observableObject protocol is similar to State
final class GameViewModel: ObservableObject {
    
    // Start Menu
    @Published var animationAmount: CGFloat = 1
        
    //Investigate View
    
    var animals = ["bear", "buffalo", "chick", "chicken", "cow", "crocodile", "dog", "duck", "elephant", "frog", "giraffe", "goat", "gorilla", "hippo", "horse", "monkey", "moose", "narwhal", "owl", "panda", "parrot", "penguin", "pig", "rabbit", "rhino", "sloth", "snake", "walrus", "whale", "zebra"].shuffled()
    
    func colum1(number: Int) -> Int {
        let remainder = number % 2
        return (number / 2) + remainder
    }
    
    //QuestionAskingView
    
    struct StylizedButton: ViewModifier {
        var width: CGFloat
        var height: CGFloat
        var textSize: CGFloat
        
        func body(content: Content) -> some View {
            content
                .frame(width: width, height: height, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .font(.system(size: textSize))
                .background(Color.red)
                .foregroundColor(.white)
                .cornerRadius(20)
        }
    }
    struct SFSymbolDesign: View {
        var sfSymbolName: String
        var fontSize: CGFloat
        
        var body: some View {
            Image(systemName: sfSymbolName)
                .imageScale(.large)
                .foregroundColor(.white)
                .font(.system(size: fontSize))
        }
    }
}
