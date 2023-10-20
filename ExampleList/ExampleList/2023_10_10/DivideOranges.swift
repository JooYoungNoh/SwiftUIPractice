//
//  DivideOranges.swift
//  ExampleList
//
//  Created by 노주영 on 2023/10/20.
//

import SwiftUI

//MARK: 예제2 (오렌지 나누기)
struct DivideOranges: View{
    @Environment(\.dismiss) private var dismiss
    @FocusState private var isFocused: Bool
    
    @State private var orangeCount: String = ""
    @State private var boxCount: String = ""
    @State private var resultOrange: String = "0"
    @State private var resultBox: String = "0"
    
    var body: some View{
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
            VStack{
                Text("오렌지 나누기")
                    .modifier(StandardCustomFontTitle())
                
                HStack{
                    Image(systemName: "applelogo")
                        .resizable(resizingMode: .tile)
                        .frame(width: 40.0, height: 50.0)
                    
                    TextField("오렌지 갯수", text: $orangeCount)
                        .multilineTextAlignment(.center)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .border(.black, width: 2)
                        .cornerRadius(5)
                        .keyboardType(.numberPad)
                        .focused($isFocused)
                        .padding(.top, 10)
                        .padding(.leading, 10)
                }
                .padding(.top ,10)
                .padding(.horizontal, 20)
                
                HStack{
                    Image(systemName: "shippingbox")
                        .resizable(resizingMode: .tile)
                        .frame(width: 40.0, height: 50.0)
                    
                    TextField("박스의 수", text: $boxCount)
                        .multilineTextAlignment(.center)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .border(.black, width: 2)
                        .cornerRadius(5)
                        .keyboardType(.numberPad)
                        .focused($isFocused)
                        .padding(.leading, 10)
                }
                .foregroundColor(.black)
                .padding(.top ,10)
                .padding(.horizontal, 20)
                
                Button(action: self.touchInSide, label: {
                    Text("↓")
                })
                .font(.custom("MaplestoryOTFLight", size: 50))
                .foregroundStyle(.black)
                
                HStack{
                    Image(systemName: "applelogo")
                        .resizable(resizingMode: .tile)
                        .frame(width: 40.0, height: 50.0)

                    Image(systemName: "multiply.circle")
                        .resizable(resizingMode: .tile)
                        .frame(width: 40.0, height: 50.0)
                        .padding(.top, 10)
                        .padding(.horizontal, 10)
                    
                    Text(resultOrange)
                        .modifier(StandardCustomFontTitle())
                        .padding(.top, 10)
                        .padding(.trailing, 15)
                }
                
                
                HStack{
                    Image(systemName: "shippingbox")
                        .resizable(resizingMode: .tile)
                        .frame(width: 40.0, height: 50.0)
                    
                    Image(systemName: "multiply.circle")
                        .resizable(resizingMode: .tile)
                        .frame(width: 40.0, height: 50.0)
                        .padding(.top, 10)
                        .padding(.horizontal, 10)
                    
                    Text(resultBox)
                        .modifier(StandardCustomFontTitle())
                        .padding(.top, 10)
                        .padding(.trailing, 16)
                    
                }
            }
            
            Spacer()
        }
    }
    
    func touchInSide(){
        if self.orangeCount != "" && self.boxCount != ""{
            self.resultOrange = String(Int(self.orangeCount)!%Int(self.boxCount)!)
            self.resultBox = String(Int(self.orangeCount)!/Int(self.boxCount)!)
        }
        isFocused = false
    }
}

#Preview {
    DivideOranges()
}

