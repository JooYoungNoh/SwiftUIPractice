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
    //비동기로 처리하는 함수
    func sum(start: Int, end: Int) async -> Int{
        var sumNumber: [Int: Int] = [:]
        var sum: Int = 0
        let arr: [Int] = [0, 50]
        
        await withTaskGroup(of: (Int, Int).self){ group in
            for i in 0...1{
                group.addTask{
                    return(i, await sumSub(arr[i]+1, arr[i]+50))
                }
            }
            
            for await (task, result) in group {
                sumNumber.updateValue(result, forKey: task)
            }
            
            for (key, value) in sumNumber{
                sum += sumNumber[key] ?? 0
                print("\(key): \(value)")
            }
            print("결과: \(sum)")
        }
        return sum
    }
    //더하는 함수
    func sumSub(_ start: Int, _ end: Int) async -> Int {
        sleep(2)
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
