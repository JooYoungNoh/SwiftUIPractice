//
//  ContentView.swift
//  SimpleSixthPractice
//
//  Created by 노주영 on 2023/10/19.
//

import SwiftUI

enum DurationError: Error {
    case tooLong
    case tooShort
}

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
    
    // 작업 그룹
    // 동적인 조건에 따라 여러 작업을 동시에 생성하고 실행해야 하는 상황
    // withTaskGroup() 함수 사용
    // addTask():   함수를 호출하여 각각의 새로운 작업을 추가
    // cancelAll(): 그룹의 모든 작업을 취소하는 메서드
    // isCancelled: 작업 그룹이 이미 취소되었는지 여부를 확인하는 속성
    // isEmpty:     작업 그룹 내에 작업이 남아 있는지 여부를 확이하는 속성
    func doSomething() async {
        print("Start \(Date())")
        
        await withTaskGroup(of: Void.self) { group in
            for i in 1...5 {
                group.addTask {
                    let result = await takeTooLong()
                    print("Completed Task \(i) = \(result)")
                }
            }
        }
    }
    func takeTooLong() async -> Date {
        sleep(UInt32.random(in: 1...5))
        return Date()
    }
}

#Preview {
    ContentView()
}
