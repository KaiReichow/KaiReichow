//
//  SelectTableView.swift
//  MultiplicationTables
//
//  Created by Kai Reichow on 9/17/21.
//

import SwiftUI

struct SelectTableView: View {
    @State var scaleEffect: CGFloat = 1
    @State var animationAmount = 0.0

    var body: some View {

        ZStack {
            
            AppBackground()
            
            ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: false) {
                ForEach(1..<13) { number in
                    NavigationLink(
                        destination: HowManyQuestions(tableChoice: number),
                        label: {
                            Text("\(number)'s Table")
                                .modifier(StylizedButton(width: 320, height: 80, textSize: 30))
                        })
                        .rotation3DEffect(.degrees(animationAmount), axis: (x: 1, y: 0, z: 0)
                        )
                        .animation(Animation.default.delay(Double(number) / 4))
                        .onAppear() {
                            withAnimation {
                                self.animationAmount += 360
                            }
                        }
                    Spacer(minLength: 10)
                }
            }
        }
    }
}

struct SelectTableView_Previews: PreviewProvider {
    static var previews: some View {
        SelectTableView()
    }
}
