//
//  ContentView.swift
//  WeSplit
//
//  Created by Genevieve Krzeminski on 2/12/23.
//

import SwiftUI

struct ContentView: View {
    @State private var tapCount = 0
    @State private var name = ""
    let students = ["Harry", "Hermione", "Ron"]
    @State private var selectedStudent = "Harry"


   
    var body: some View {
        Button("Tap Count: \(tapCount)") {
                    tapCount += 1
                }
        
        NavigationView {
            Picker("Select your student", selection: $selectedStudent) {
                                ForEach(students, id: \.self) {
                                    Text($0)
                                }
                            }
            }
        Form {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                
                Section {
                    TextField("Enter your name", text: $name)
                    Text("Your name is \(name)")
                    
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
