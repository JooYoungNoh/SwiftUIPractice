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
    
    // async-let 바인딩
    // 비동기 함수를 호출하고 주변의 코드와 병렬로 실행하려면(동시 실행)
    // 상수를 정의할 때 let 앞에 async를 작성하고, 상수를 사용할 때마다 await를 작성
    func doSomething() async {
        print("Start \(Date())")
        async let result = takeTooLong()
        print("After async-let \(Date())")
        
        //비동기 함수와 동시에 실행할 추가 코드
        for i in 1...10 { print(i) }
        
        print("End \(await result)")
    }
    func takeTooLong() async -> Date {
        sleep(5)
        return Date()
    }
}

#Preview {
    ContentView()
}
