//
//  ContentView.swift
//  SwiftUI-Test
//
//  Created by Elliot Tikhomirov on 16/11/19.
//  Copyright © 2019 Elliot Tikhomirov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
   
    let rTarget = Double.random(in: 0..<1)
    let gTarget = Double.random(in: 0..<1)
    let bTarget = Double.random(in: 0..<1)
    @State var rGuess: Double
    @State var gGuess: Double
    @State var bGuess: Double
    @State var showAlert = false
    
     func computeScore() -> Int {
      let rDiff = rGuess - rTarget
      let gDiff = gGuess - gTarget
      let bDiff = bGuess - bTarget
      let diff = sqrt(rDiff * rDiff + gDiff * gDiff + bDiff * bDiff)
      return Int((1.0 - diff) * 100.0 + 0.5)
    }
    
    var body: some View {
        VStack {
            VStack {
                VStack {
                    Text("Swift UI Test")
                        .foregroundColor(Color.black).bold().padding()
                    HStack {
                      VStack {
                        Color(red: rTarget, green: gTarget, blue: bTarget)
                        Text("Match this color")
                      }
                      VStack {
                        Color(red: rGuess, green: gGuess, blue: bGuess)
                        Text("R: \(Int(rGuess * 255.0))"
                          + "  G: \(Int(gGuess * 255.0))"
                          + "  B: \(Int(bGuess * 255.0))")
                      }
                    }.padding()
                }
               
                CustomSlider(value: $rGuess, textColor: .red)
                CustomSlider(value: $gGuess, textColor: .green)
                CustomSlider(value: $bGuess, textColor: .blue)
                Button(action: { self.showAlert = true }) {
                                   Text("Hit me").frame(minWidth: 0, maxWidth: .infinity).padding()
                               }.alert(isPresented: $showAlert) {
                                 Alert(title: Text("Your Score"),
                                       message: Text(String(computeScore())))
                               }.padding()
            }
           
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
       ContentView(rGuess: 0.4, gGuess: 0.2, bGuess: 0.1)
        
    }
}

struct CustomSlider: View {
    @Binding var value: Double
    var textColor: Color
    var body: some View {
        HStack {
            Text("0").foregroundColor(textColor)
            Slider(value: $value)
            Text("255").foregroundColor(textColor)
        }.padding()
    }
}
