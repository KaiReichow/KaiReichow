//
//  HowManyQuestions.swift
//  MultiplicationTables
//
//  Created by Kai Reichow on 9/18/21.
//

import SwiftUI

struct HowManyQuestions: View {
    @State private var animationAmount: CGFloat = 1
    var tableChoice: Int
    
    var body: some View {
        ZStack {
            
            AppBackground()

            VStack {
                Spacer()

                Text("How Many Questions?")
                    .bold()
                    .frame(width: 240, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
                    .cornerRadius(30)
                Spacer()

                NavigationLink(
                    destination: QuestionAskingView(questionAmount: 5, multiplicationTableSelection: tableChoice),
                    label: {
                        Text("5")
                            .modifier(StylizedButton(width: 240, height: 100, textSize: 30))
                    })

                Spacer()

                NavigationLink(
                    destination: QuestionAskingView(questionAmount: 10, multiplicationTableSelection: tableChoice),
                    label: {
                        Text("10")
                            .modifier(StylizedButton(width: 240, height: 100, textSize: 30))
                    })

                Spacer()

                NavigationLink(
                    destination: QuestionAskingView(questionAmount: 12, multiplicationTableSelection: tableChoice),
                    label: {
                        Text("All")
                            .modifier(StylizedButton(width: 240, height: 100, textSize: 30))
                    })

                Spacer()
            }
        }
    }
}

struct HowManyQuestions_Previews: PreviewProvider {
    static var previews: some View {
        HowManyQuestions(tableChoice: 1)
    }
}
