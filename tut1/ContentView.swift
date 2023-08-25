//
//  ContentView.swift
//  tut1
//
//  Created by Sahil Raj on 24/08/23.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount =  0.0
    @State private var numberOfPeople = 2
    @State private var percentage = 20;
    @FocusState private var amountIsFocused
    let tipPercentages = [10,15,20,25,0]
    
    var totalPerPerson: Double{
        let peopleCount = Double(numberOfPeople+2)
        let tipSelection = Double(percentage)
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal/peopleCount
        return amountPerPerson
    }
    var body: some View {
        NavigationView{
            
            Form{
                Section{
                    TextField("amount ", value: $checkAmount, format: .currency(code: "INR"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    Picker("Kitne Aadmi Hai", selection: $numberOfPeople){
                        ForEach(2..<100){
                            Text("\($0) Aadmi")
                        }
                    }
                }
                Section{
                    
                    Picker("Tip percentage", selection: $percentage){
                        ForEach(tipPercentages, id: \.self){
                            Text($0, format: .percent)
                        }
                           }
                    .pickerStyle(.segmented)
                } header: {
                    Text("How much tip do you want to leave?")
                        .foregroundColor(Color.red)
                }
                Section {
                    Text(totalPerPerson, format: .currency(code: "INR"))
                }
                
            }
            .navigationTitle(Text("Batwara"))
                
            .navigationBarTitleDisplayMode(.inline)

                
            
            .toolbar{
                ToolbarItemGroup(placement: .keyboard){
                    Button("Done"){
                        amountIsFocused = false
                    }
                }
                
            }
            
            
        }
        
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
