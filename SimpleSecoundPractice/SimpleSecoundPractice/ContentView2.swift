//
//  ContentView2.swift
//  SimpleSecoundPractice
//
//  Created by 노주영 on 2023/10/11.
//

import SwiftUI

//예제 7
struct ContentView2: View {
    @State private var time: String = ""
    @State private var money: String = ""
    @State private var result: String = ""
    
    @FocusState private var isFocused: Bool
    
    var body: some View {
        VStack {
            Text("시급 계산기")
                .font(.custom("YanoljaYacheB", size: 60))
                .padding(20)
            
            HStack{
                Image(systemName: "clock")
                    .resizable(resizingMode: .tile)
                    .modifier(standardCustomImage())
                    .padding(.leading, 50)
                    .padding(10)
                
                TextField("시간", text: $time)
                    .modifier(StandardCustomFont())
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)
                    .multilineTextAlignment(.leading)
                    .border(.gray, width: 2)
                    .cornerRadius(5.0)
                    .padding(.top, -2)
                    .padding(.trailing, 60)
                    .focused($isFocused)
            }
            
            HStack{
                Image(systemName: "dollarsign.circle")
                    .resizable(resizingMode: .tile)
                    .modifier(standardCustomImage())
                    .padding(.leading, 50)
                    .padding(10)
                
                TextField("시급", text: $money)
                    .modifier(StandardCustomFont())
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)
                    .multilineTextAlignment(.leading)
                    .border(.gray, width: 2)
                    .cornerRadius(5.0)
                    .padding(.top, -2)
                    .padding(.trailing, 60)
                    .focused($isFocused)
            }
            
            if time != "" && money != "" {
                Button(action: self.touchInSide, label: {
                    Text("↓")
                        .font(.custom("YanoljaYacheB", size: 60))
                        .modifier(StandardCustomFont())
                        .multilineTextAlignment(.center)
                })
            }
            
            Text("\(result)")
                .font(.custom("YanoljaYacheB", size: 60))
                .multilineTextAlignment(.center)
                .modifier(StandardCustomFont())
                .padding(20)
        }
    }
    //화살표 버튼 메서드
    func touchInSide(){
        guard let changeTime = Double(self.time) else { return }
        guard let changeMoney = Double(self.money) else { return }
        print(changeTime)
        print(changeMoney)
        
        if changeTime > 8 {
            self.result = "총 급여 :  \(Int(changeMoney*8 + changeMoney*(changeTime-8)*1.5))"
        } else {
            self.result = "총 급여 :  \(Int(changeMoney*changeTime))"
        }
        isFocused = false
    }
}

struct standardCustomImage: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .frame(width: 40.0, height: 50.0)
            .foregroundStyle(.black)
    }
}

#Preview {
    ContentView2()
}
