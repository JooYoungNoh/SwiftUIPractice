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
            Button(action: {
                //동기 함수(action부분이 메인 스레드에서 동작)에서 비동기 함수 호출(Task
                Task {
                    await doSomething()
                }
            }, label: {
                Text("Do Something")
            })
        }
        .padding()
    }
    
    //비동기 함수 선언 async
    //비동기 함수 호출 await
    func doSomething() async {
        print("Start \(Date())")
        await takeTooLong()
        print("Start \(Date())")
    }
    func takeTooLong() async {
        sleep(5)
        print("Async task completed at \(Date())")
    }
}

#Preview {
    ContentView()
}
