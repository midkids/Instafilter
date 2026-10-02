//
//  ContentView.swift
//  Instafilter
//
//  Created by Myron Snelson on 9/30/26.
//

import SwiftUI

struct ContentView: View {
/*
    @State private var blurAmount = 0.0 {
        // Problem: this print statement is not activated
        // by changing the slider, but it is activated
        // by the pressing of the randcom blur button
        // to fix this, we have to use the .onChange modifier
        // which tells SwiftUI to run a function of our
        // choosing whenever a particular value changes
        // SwiftUI will pass in both old and new values
        // to the function
        didSet {
            print("New value is: \(blurAmount)")
        }
    }
*/

    @State private var blurAmount = 0.0
    var body: some View {
        VStack {
            Text("Hello, world!")
                .blur(radius: blurAmount)
            Slider(value: $blurAmount, in: 0...20)
            // This onChange modifier WILL activate the print
            // statement each time the slider is changed
                .onChange(of: blurAmount) {
                    oldValue, newValue in
                    print("New value is: \(newValue)")
                }
            // Presssing the button will also update the slider
            // to the random amount of blur
            Button("Random Blur") {
                blurAmount = Double.random(in: 0...20)
            }
        }
    }
}

#Preview {
    ContentView()
}
