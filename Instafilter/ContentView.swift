//
//  ContentView.swift
//  Instafilter
//
//  Created by Myron Snelson on 9/30/26.
//
// How property wrappers become structs
// Responding to state changes using onChange()
// Showing multiple options with confirmationDialog()

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
    

/*
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
 */
    
    // The confirmation dialog which is an alternative to alert
    // that is great when you want to show many options
    // Confirmation dialog's slide up from the bottom and can
    // have as many buttons as you want and can be dismissed
    // by tapping cancel or by tapping the view behind
    // the dialog
    // They are very similar to alerts in that both:
    // - can be created by attaching a modifier to our view
    // - are shown by SwiftUI automatically when a condition
    //   of our choosing becomes true
    // - can be filled with buttons to take various actions
    // - can optionally have a second closure attached to show
    //   an extra message
    @State private var showingConfirmation = false
    @State private var backgroundColor = Color.black
    var body: some View {
        Button("Hello World!") {
            showingConfirmation.toggle()
        }
        // These hard-coded values are intentional because
        //
        .frame(width: 300, height: 300)
        .background(backgroundColor)
        // Confirmation dialog
        // It accepts three parameters
        // 1. the title to show
        // 2. the binding to decide whether or not it is showing
        //    right now
        // 3. a closure containing all the buttons that should be
        //    provided inside it
        //    usually as a trailing closure
        // IMPORTANT: You do not have to have a cancel button
        // a the last button, but you should to make that a clear
        // option for the user
        .confirmationDialog("Change background", isPresented: $showingConfirmation) {
            Button("Red") { backgroundColor = .red }
            Button("Green") { backgroundColor = .green }
            Button("Blue") { backgroundColor = .blue}
            // This cancel button that includes the cancel role
            // does not work.
            // SwiftUI presents the confirmation dialog as a popover
            // and omits the .cancel button because tapping outside
            // the popover is the system-provided cancellation
            // gesture.
            // Button("Cancel", role: .cancel) { }
            
            // Removing role: .cancel prevents the system from
            // treating it as the replaceable system-dismiss action,
            // so it should remain visible. The tradeoff is that it
            // won’t receive the platform’s special Cancel semantics
            // or styling.
            Button("Cancel") { }
        } message: {
            Text("Selected a new color")
        }
    }
}

#Preview {
    ContentView()
}
