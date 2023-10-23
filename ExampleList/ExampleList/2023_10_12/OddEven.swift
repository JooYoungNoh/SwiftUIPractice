//
//  OddEven.swift
//  ExampleList
//
//  Created by 노주영 on 2023/10/23.
//

import SwiftUI

struct OddEven: View {
    @Environment(\.dismiss) private var dismiss
    @FocusState private var isFocused: Bool
    
    @State private var number: String = ""
    @State private var result: String = "대기중..."
    
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
                Text("홀 짝")
                    .modifier(StandardCustomFontTitle())
                    .padding(20)
                
                HStack{
                    Image(systemName: "number.square")
                        .resizable(resizingMode: .tile)
                        .frame(width: 40.0, height: 40.0)
                        .foregroundStyle(.black)
                        .padding(.trailing, 10)
                    
                    TextField("ex) 10", text: $number)
                        .modifier(StandardCustomFontText())
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numberPad)
                        .multilineTextAlignment(.leading)
                        .border(.gray, width: 2)
                        .cornerRadius(5.0)
                        .focused($isFocused)
                }
                .padding(20)
                
                Button(action: self.touchInSide, label: {
                    Text("↓")
                        .font(.custom("MaplestoryOTFLight", size: 50))
                        .foregroundStyle(.black)
                        .multilineTextAlignment(.center)
                })
                
                Text("\(result)")
                    .modifier(StandardCustomFontTitle())
                    .padding(20)
            }
            Spacer()
        }
        .navigationBarBackButtonHidden()
    }
    //화살표 버튼 메서드
    func touchInSide(){
        isFocused = false
        if let changeNumber = Int(self.number){
            if changeNumber > 0 {
                self.result = changeNumber%2 == 0 ? "짝수" : "홀수"
            } else {
                self.result = "0보다 커야됩니다!!"
            }
        }
    }
}

#Preview {
    OddEven()
}
