//
//  HourlyRate.swift
//  ExampleList
//
//  Created by 노주영 on 2023/10/23.
//

import SwiftUI

struct HourlyRate: View {
    @Environment(\.dismiss) private var dismiss
    @FocusState private var isFocused: Bool
    
    @State private var time: String = ""
    @State private var money: String = ""
    @State private var result: String = ""
    
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
            VStack {
                Text("시급 계산기")
                    .modifier(StandardCustomFontTitle())
                    .padding(20)
                
                HStack{
                    Image(systemName: "clock")
                        .resizable(resizingMode: .tile)
                        .frame(width: 40.0, height: 40.0)
                        .foregroundStyle(.black)
                        .padding(.trailing, 10)
                    
                    TextField("시간", text: $time)
                        .modifier(StandardCustomFontText())
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numberPad)
                        .multilineTextAlignment(.leading)
                        .border(.gray, width: 2)
                        .cornerRadius(5.0)
                        .focused($isFocused)
                }
                .padding(20)
                
                HStack{
                    Image(systemName: "dollarsign.circle")
                        .resizable(resizingMode: .tile)
                        .frame(width: 40.0, height: 40.0)
                        .foregroundStyle(.black)
                        .padding(.trailing, 10)
                    
                    TextField("시급", text: $money)
                        .modifier(StandardCustomFontText())
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numberPad)
                        .multilineTextAlignment(.leading)
                        .border(.gray, width: 2)
                        .cornerRadius(5.0)
                        .focused($isFocused)
                }
                .padding(.horizontal, 20)
                
                if time != "" && money != "" {
                    Button(action: self.touchInSide, label: {
                        Text("↓")
                            .font(.custom("MaplestoryOTFLight", size: 50))
                            .foregroundStyle(.black)
                            .multilineTextAlignment(.center)
                    })
                    .padding()
                }
                
                Text("\(result)")
                    .modifier(StandardCustomFontTitle())
                    .multilineTextAlignment(.center)
                    .padding(20)
            }
            Spacer()
        }
        .navigationBarBackButtonHidden()
    }
    //화살표 버튼 메서드
    func touchInSide(){
        guard let changeTime = Double(self.time) else { return }
        guard let changeMoney = Double(self.money) else { return }
        
        if changeTime > 8 {
            self.result = "총 급여 :  \(Int(changeMoney*8 + changeMoney*(changeTime-8)*1.5))"
        } else {
            self.result = "총 급여 :  \(Int(changeMoney*changeTime))"
        }
        isFocused = false
    }
}


#Preview {
    HourlyRate()
}
