//
//  InvestigateView.swift
//  MultiplicationTables
//
//  Created by Kai Reichow on 9/21/21.
//

import SwiftUI

struct InvestigateView: View {
    @StateObject private var viewModel = GameViewModel()
    @State var animationAmount = 0
    var num1: Int
    var num2: Int
    @State var rows = 0

    var body: some View {
        ZStack {
            AppBackground()
            
            VStack(spacing: 5) {
                Text("\(num1) \(viewModel.animals[0])(s)")
                    .modifier(StylizedButton(width: 320, height: 60, textSize: 30))

                
                HStack(spacing: 5) {
                    ForEach(0..<viewModel.colum1(number: num1)) { num in
                        Image(viewModel.animals[0])
                            .resizable()
                            .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .lineLimit(3)
                    }
                }
                HStack(spacing: 5) {
                    ForEach(0..<num1 / 2) { num in
                        Image(viewModel.animals[0])
                            .resizable()
                            .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .lineLimit(3)
                    }
                }
                
                Text("\(num2) \(viewModel.animals[0])(s)")
                    .modifier(StylizedButton(width: 320, height: 60, textSize: 30))
                
                HStack{
                    ForEach(0..<viewModel.colum1(number: num2)) { num in
                        Image(viewModel.animals[0])
                            .resizable()
                            .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .lineLimit(3)
                    }
                }
                .padding(num2 == 0 ? 50 : 0)
                
                HStack{
                    ForEach(0..<num2 / 2) { num in
                        Image(viewModel.animals[0])
                            .resizable()
                            .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    }
                }
                
                Text("\(num1 * num2) \(viewModel.animals[0])(s)!")
                    .modifier(StylizedButton(width: 320, height: 60, textSize: 30))
                
                ForEach(!(num2 == 0) ? 0..<num1 : 0..<1) { col in
                    HStack {
                        ForEach(num2 == 0 ? 0..<num1 : 0..<num2) { row in
                            VStack {
                                Image(viewModel.animals[0])
                                    .resizable()
                                    .frame(width: 20, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .opacity(num2 == 0 ? 0.4 : 1)
                                    .rotation3DEffect(.degrees(Double(animationAmount)), axis: (x: 0, y: 1, z: 0)
                                    )
                                    .animation(Animation.default.delay(Double(row) / 4))
                                    .onAppear() {
                                        withAnimation {
                                            self.animationAmount += 360
                                        }
                                    }
                            }
                        }
                    }
                }
            }
        }
    }
}
struct InvestigateView_Previews: PreviewProvider {
    static var previews: some View {
        InvestigateView(num1: 12, num2: 0)
    }
}
