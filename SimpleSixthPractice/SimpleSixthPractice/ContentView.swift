//
//  ContentView.swift
//  SimpleSixthPractice
//
//  Created by 노주영 on 2023/10/19.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button(action: {doSomething()}, label: {
                Text("Do Something")
            })
        }
        .padding()
    }
    
    func doSomething(){
        print("Start \(Date())")
        takeTooLong()
        print("Start \(Date())")
    }
    func takeTooLong(){
        sleep(5)
        print("Async task completed at \(Date())")
    }
}

#Preview {
    ContentView()
}
