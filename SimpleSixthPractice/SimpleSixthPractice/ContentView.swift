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
    
    // async-let 바인딩
    // 비동기 함수를 호출하고 주변의 코드와 병렬로 실행하려면(동시 실행)
    // 상수를 정의할 때 let 앞에 async를 작성하고, 상수를 사용할 때마다 await를 작성
    func doSomething() async {
        print("Start \(Date())")
        do {
            try await takeTooLong(delay: 15)
            print("성공")
        } catch DurationError.tooShort {
            print("너무 짧습니다")
        } catch DurationError.tooLong {
            print("너무 깁니다")
        } catch {
            print("알 수 없는 에러")
        }
        print("End: \(Date())")
    }
    func takeTooLong(delay: UInt32) async throws {
        if delay < 5 {
            throw DurationError.tooShort
        } else if delay > 20 {
            throw DurationError.tooLong
        }
        sleep(5)
        print("Async tack complated at \(Date())")
    }
}

#Preview {
    ContentView()
}
