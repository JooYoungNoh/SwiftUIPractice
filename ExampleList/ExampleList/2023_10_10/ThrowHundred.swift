//
//  ThrowHundred.swift
//  ExampleList
//
//  Created by 노주영 on 2023/10/20.
//

import SwiftUI

struct ThrowHundred: View {
    @Environment(\.dismiss) private var dismiss
    @FocusState private var isFocused: Bool
    
    @State private var number1: String = ""
    @State private var result: String = ""
    
    var body: some View{
        VStack{
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
                Text("일의 자리 1로 바꾸기")
                    .modifier(StandardCustomFontTitle())
                    .multilineTextAlignment(.center)
                
                TextField("ex) 456", text: $number1)
                    .modifier(StandardCustomFontText())
                    .multilineTextAlignment(.leading)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .border(.black, width: 2)
                    .keyboardType(.numberPad)
                    .focused($isFocused)
                    .padding(.horizontal, 35)
                    .padding(.vertical, 20)
                
                Button(action: self.touchInSide, label: {
                    if let _ = Int(self.number1){
                        Text("↓")
                            .font(.custom("MaplestoryOTFLight", size: 50))
                            .foregroundStyle(.black)
                            .multilineTextAlignment(.center)
                    }
                })
                
                Text(result)
                    .modifier(StandardCustomFontTitle())
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 35)
                    .padding(.vertical, 20)
            }
            
            Spacer()
        }
        .navigationBarBackButtonHidden()
    }
    func touchInSide(){
        self.result = String(Int(self.number1)!/10*10+1)
        self.number1 = ""
    }
}


#Preview {
    ThrowHundred()
}
