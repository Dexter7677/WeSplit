//
//  ContentView.swift
//  WeSplit
//
//  Created by Deepak Singh on 08/07/20.
//  Copyright © 2020 dexter. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var peopleCount = ""
    private var numberOfPeople: Int{
        return Int(peopleCount) ?? 0
    }
    
    @State private var tipPercent = 2
    
    private var totalPerPerson :Double {
        let numberOfPerson =  Double(numberOfPeople + 2)
        return self.totalCheckAmount/numberOfPerson
    }
    private var totalCheckAmount: Double{
        let cAmount = Double(checkAmount) ?? 0
        let tipPercentage = Double(tips[tipPercent])
        return cAmount + (cAmount * tipPercentage)/100
    }
    let tips = [10,15,20,0]
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Enter Check amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    TextField("Enter Number of people", text: $peopleCount).keyboardType(.numberPad)
                }
                Section(header: Text("How much tip you want to pay?")){
                    Picker("Tip percentage", selection: $tipPercent){
                        ForEach(0..<tips.count){
                            Text("\(self.tips[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                }
                
                Section{
                    Text("Total Check Amount: \(self.totalCheckAmount, specifier:"%.2f")")
                }
                
                Section(header: Text("Amount per person")){
                    Text("$ \(totalPerPerson, specifier:"%.2f")")
                    
                }
            }.navigationBarTitle("We Split")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
