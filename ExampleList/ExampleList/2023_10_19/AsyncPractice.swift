//
//  AsyncPractice.swift
//  ExampleList
//
//  Created by 노주영 on 2023/10/24.
//

import SwiftUI

enum DurationError: Error {
    case tooLong
    case tooShort
}

struct AsyncPractice: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {dismiss()}, label: {
                    Text("< Back")
                        .font(.custom("MaplestoryOTFLight", size: 25))
                        .foregroundStyle(.black)
                        .bold()
                    
                })
                Spacer()
            }
            .padding(.horizontal, 20)
            
            Spacer()
            Button(action: {
                //동기 함수(action부분이 메인 스레드에서 동작)에서 비동기 함수 호출(Task
                Task {
                    await doSomething()
                }
            }, label: {
                Text("Do Something")
                    .modifier(StandardCustomFontTitle())
            })
            .padding(20)
            Spacer()
        }
        .navigationBarBackButtonHidden()
    }
    
    // 작업 그룹
    // 동적인 조건에 따라 여러 작업을 동시에 생성하고 실행해야 하는 상황
    // withTaskGroup() 함수 사용
    // addTask():   함수를 호출하여 각각의 새로운 작업을 추가
    // cancelAll(): 그룹의 모든 작업을 취소하는 메서드
    // isCancelled: 작업 그룹이 이미 취소되었는지 여부를 확인하는 속성
    // isEmpty:     작업 그룹 내에 작업이 남아 있는지 여부를 확이하는 속성
    // 데이터 경쟁 피하기
    // 동시에 데이터에 접근하는 여러 작업은 데이터 경쟁(Data race) 조건이 발생할 위험이 있음
    // 여러 작업이 동시에 동일한 데이터에 접근하고 시도하면 데이터 오류가 발생
    func doSomething() async {
        var timeStamps: [Int: Date] = [:]
        print("Start \(Date())")
        
        // 반환 타입을 변경 : Void.self -> (Int, Date)
        await withTaskGroup(of: (Int, Date).self) { group in
            for i in 1...5 {
                group.addTask {
                    return (i, await takeTooLong())
                }
            }
            // for-await 표현식을 사용하여 비동기적으로 반환되는 일련의 값을 루프
            // 동시 작업에서 반환되는 값의 수신을 기다려서 처리
            // 일련의 데이터가 AsyncSequence 프로토콜 준수가 필수 요구사항
            for await (task, date) in group {
                timeStamps.updateValue(date, forKey: task)
            }
            
            // 작업 그룹이 종료된 후 저장된 timeStamps 딕셔너리 항목을 출력
            for (task, date) in timeStamps {
                print("Task: \(task), date: \(date)")
            }
        }
    }
    func takeTooLong() async -> Date {
        sleep(UInt32.random(in: 1...5))
        return Date()
    }
}

#Preview {
    AsyncPractice()
}
