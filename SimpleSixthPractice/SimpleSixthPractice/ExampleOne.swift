//
//  ExampleOne.swift
//  SimpleSixthPractice
//
//  Created by 노주영 on 2023/10/19.
//

import SwiftUI

struct ExampleOne: View {
    @State private var result: Int = 0
    var body: some View {
        VStack{
            Button(action: {
                //동기 함수(action부분이 메인 스레드에서 동작)에서 비동기 함수 호출(Task
                Task {
                    result = await sum(start: 1, end: 100)
                }
            }, label: {
                Text("Do Sum")
            })
            
            Text("\(result)")
                .padding(.top, 30)
        }
    }
    func sum(start: Int, end: Int) async -> Int {
        async let a = sumSub(start, end/2)
        async let b = sumSub(end/2+1, end)
        return await a + b
    }
    
    func sumSub(_ start: Int, _ end: Int) async -> Int {
        sleep(1)
        var sum = 0
        (start...end).forEach{
            sum += $0
        }
        return sum
    }
}

#Preview {
    ExampleOne()
}
