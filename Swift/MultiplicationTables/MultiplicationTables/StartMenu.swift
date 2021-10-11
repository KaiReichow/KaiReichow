//
//  StartMenu.swift
//  MultiplicationTables
//
//  Created by Kai Reichow on 9/17/21.
//

import SwiftUI

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
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.white, lineWidth: 2)
            )
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
struct AppBackground: View {
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [Color.red, Color.yellow]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}
struct AppTitleAnimation: View {
    @State var degrees: CGFloat
    var text: String
    
    var body: some View {
        Text(text)
            .frame(width: 360, height: 140, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .font(.system(size: 40))
            .background(Color.red)
            .foregroundColor(.white)
            .cornerRadius(40)
            .overlay(
                RoundedRectangle(cornerRadius: 40)
                    .stroke(Color.white, lineWidth: 2)
            )
    }
}

struct StartMenu: View {
    @StateObject private var viewModel = GameViewModel()
    
    var body: some View {
        NavigationView {
        ZStack {
            AppBackground()
            
            Spacer()
            VStack(spacing: 100) {
                AppTitleAnimation(degrees: 1, text: "Multiplication Tables")
                
                NavigationLink(
                    destination: SelectTableView(),
                    label: {
                        Text("Start Game")
                            .font(.largeTitle)
                            .padding(90)
                            .background(Color.red)
                            .foregroundColor(.white)
                            .clipShape(Circle())
                    })
            }
            Spacer()
        }
        }
        .navigationBarHidden(true)
        .accentColor(Color(.label))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StartMenu()
    }
}
