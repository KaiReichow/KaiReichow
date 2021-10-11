//
//  ContentView.swift
//  TemperatureConversion
//
//  Created by Kai Reichow on 8/27/21.
//

import SwiftUI

struct ContentView: View {
    @State private var temperature = ""
    @State private var selectedTemp = 0
    @State private var desiredTempUnit = 0
    private let tempArray = ["Celsius", "Fahrenheit", "Kelvin"]
    private var unit: Double {
        var tempDouble = Double(temperature) ?? 0
        
        switch(selectedTemp) {
        case 0 : break
        case 1 : tempDouble = (tempDouble - 32) * (5/9)
        case 2 : tempDouble = (tempDouble - 273.15)
        default: break
        }
        
        
        switch(desiredTempUnit) {
        case 0: break
        case 1: tempDouble = (tempDouble * (9/5)) + 32
        case 2: tempDouble = (tempDouble + 273.15)
        default: break
        }
        
        return tempDouble
    }
    

    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Enter Temperature", text: $temperature)
                        .keyboardType(.decimalPad)
                }

                
                Section {
                    Text("Units From")
                    Picker("Units From", selection: $selectedTemp) {
                        ForEach(0 ..< tempArray.count) {
                            Text("\(self.tempArray[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    Text("Units To")
                    Picker("Units To", selection: $desiredTempUnit) {
                        ForEach(0 ..< tempArray.count) {
                            Text("\(self.tempArray[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                }
                Section {
                    Text("From \(tempArray[selectedTemp]) to \(tempArray[desiredTempUnit]) is \(unit, specifier: "%.5f")")
                }
            }
            .navigationBarTitle(Text("Convert Temperature"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
