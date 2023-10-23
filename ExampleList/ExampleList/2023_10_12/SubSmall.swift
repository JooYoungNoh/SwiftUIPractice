//
//  SubSmall.swift
//  ExampleList
//
//  Created by 노주영 on 2023/10/23.
//

import SwiftUI

struct SubSmall: View {
    @Environment(\.dismiss) private var dismiss
    @FocusState private var isFocused: Bool
    
    @State private var number1: String = ""
    @State private var number2: String = ""
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
                Text("큰 수 빼기")
                    .modifier(StandardCustomFontTitle())
                    .padding(20)
                
                HStack{
                    Image(systemName: "number.square")
                        .resizable(resizingMode: .tile)
                        .frame(width: 40.0, height: 40.0)
                        .foregroundStyle(.black)
                        .padding(.trailing, 10)
                    
                    TextField("ex) 10", text: $number1)
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
                    Image(systemName: "number.square")
                        .resizable(resizingMode: .tile)
                        .frame(width: 40.0, height: 40.0)
                        .foregroundStyle(.black)
                        .padding(.trailing, 10)
                    
                    TextField("ex) 30", text: $number2)
                        .modifier(StandardCustomFontText())
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numberPad)
                        .multilineTextAlignment(.leading)
                        .border(.gray, width: 2)
                        .cornerRadius(5.0)
                        .focused($isFocused)
                }
                .padding(.horizontal, 20)
                
                Button(action: self.touchInSide, label: {
                    Text("↓")
                        .font(.custom("MaplestoryOTFLight", size: 50))
                        .foregroundStyle(.black)
                        .multilineTextAlignment(.center)
                })
                .padding()
                
                Text("\(result)")
                    .modifier(StandardCustomFontTitle())
                    .padding(20)
            }
            Spacer()
        }
        .navigationBarBackButtonHidden()
    }
    
    func touchInSide(){
        isFocused = false
        guard let intNum1 = Int(self.number1) else { return }
        guard let intNum2 = Int(self.number2) else { return }
        
        self.result = intNum1 > intNum2 ? "\(intNum1-intNum2)" : "\(intNum2-intNum1)"
    }
}

#Preview {
    SubSmall()
}
