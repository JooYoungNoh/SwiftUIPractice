//
//  NumberOfBox.swift
//  ExampleList
//
//  Created by 노주영 on 2023/10/23.
//

import SwiftUI

struct NumberOfBox: View {
    @Environment(\.dismiss) private var dismiss
    @FocusState private var isFocused: Bool
    
    @State private var ball: String = ""
    @State private var box: String = ""
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
                Text("상자의 개수")
                    .modifier(StandardCustomFontTitle())
                    .padding(20)
                
                HStack{
                    Image(systemName: "basketball")
                        .resizable(resizingMode: .tile)
                        .frame(width: 40.0, height: 40.0)
                        .foregroundStyle(.black)
                        .padding(.trailing, 10)
                    
                    TextField("농구공의 개수", text: $ball)
                        .font(.custom("BazziRegular", size: 25))
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
                    Image(systemName: "shippingbox")
                        .resizable(resizingMode: .tile)
                        .frame(width: 40.0, height: 40.0)
                        .foregroundStyle(.black)
                        .padding(.trailing, 10)
                    
                    TextField("한 상자 넣을 공의 개수", text: $box)
                        .font(.custom("BazziRegular", size: 25))
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
        guard let intball = Int(self.ball) else { return }
        guard let intbox = Int(self.box) else { return }
        
        self.result = intball%intbox == 0 ? "\(intball/intbox)개" : "\(intball/intbox+1)개"
    }
}

#Preview {
    NumberOfBox()
}
