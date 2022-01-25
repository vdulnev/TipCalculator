//
//  ContentView.swift
//  TipCalculator
//
//  Created by Mohammad Azam on 9/29/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var total: String = ""
    @State private var tipPercentage: Double = 0.2
    @State private var tip: String?
    @State private var message: String = ""
    
    let tipCalculator = TipCalculator()
    
    var body: some View {
        NavigationView {
            
            VStack {
                
                TextField("Enter total", text: $total)
                    .textFieldStyle(.roundedBorder)
                    .accessibilityIdentifier("EnterTottalTextField")
                
                Picker(selection: $tipPercentage) {
                    Text("10%").tag(0.1)
                    Text("20%").tag(0.2)
                    Text("30%").tag(0.3)
                } label: {
                    EmptyView()
                }.pickerStyle(.segmented)
                    .accessibilityIdentifier("TipSelector")

                
                Button {
                  
                    message = ""
                    tip = ""
                    
                    guard let total = Double(self.total) else {
                        message = "Invalid input"
                        return
                    }
                    
                    do {
                        let result = try tipCalculator.calculate(total: total, tipPersantage: tipPercentage)
                        
                        let formatter = NumberFormatter()
                        formatter.numberStyle = .currency
                        tip = formatter.string(from: NSNumber(value: result))
                    } catch TipCalculatorError.invalidInput {
                        message = "Invalid input"
                    } catch {
                        message = error.localizedDescription
                    }
                    
                } label: {
                   Text("Calculate Tip")
                        .accessibilityIdentifier("calcTipButton")
                }
                .padding(.top, 20)
                
                Text(message)
                    .padding(.top, 50)
                
                Spacer()
                
                Text(tip ?? "")
                    .font(.system(size: 54))
                    .accessibilityIdentifier("tipText")
                
                Spacer()
                .navigationTitle("Tip Calculator")
            }.padding()
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
