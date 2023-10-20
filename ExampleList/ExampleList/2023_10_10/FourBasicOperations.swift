//
//  FourBasicOperations.swift
//  ExampleList
//
//  Created by 노주영 on 2023/10/20.
//

import SwiftUI


//MARK: 예제 1 (사칙연산)
struct FourBasicOperations: View {
    @Environment(\.dismiss) private var dismiss
    @FocusState private var isFocused: Bool
    
    @State private var number1: String = ""
    @State private var number2: String = ""
    @State private var add: String = ""
    @State private var sub: String = ""
    @State private var mul: String = ""
    @State private var div: String = ""
    
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
            VStack {
                Text("사칙연산")
                    .modifier(StandardCustomFontTitle())
                
                HStack{
                    TextField("1", text: $number1)
                        .multilineTextAlignment(.center)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .border(.black, width: 2)
                        .cornerRadius(5)
                        .keyboardType(.numberPad)
                        .focused($isFocused)
                    
                    TextField("2", text: $number2)
                        .multilineTextAlignment(.center)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .border(.black, width: 2)
                        .cornerRadius(5)
                        .keyboardType(.numberPad)
                        .focused($isFocused)
                    
                    Button(action: self.touchInSide, label: {
                        Image(systemName: "checkmark.square")
                            .resizable(resizingMode: .tile)
                            .frame(width: 35.0, height: 35.0)
                            .opacity(0.8)
                            .foregroundStyle(.black)
                    })
                }
                .padding(20)
                
                HStack{
                    VStack{
                        Text("더하기")
                        Text("↓")

                        Text(add)
                    }
                    .padding(10)
                    
                    VStack{
                        Text("빼기")
                        Text("↓")
                        Text(sub)
                    }
                    .padding(10)
                    
                    VStack{
                        Text("곱하기")
                        Text("↓")
                        Text(mul)
                    }
                    .padding(10)
                    
                    VStack{
                        Text("나누기")
                        Text("↓")
                        Text(div)
                    }
                    .padding(10)
                }
                .font(.custom("MaplestoryOTFLight", size: 24))
                .frame(maxWidth: .infinity)
                .border(.black, width: 2)
                .cornerRadius(5)
                .padding(20)
            }
            Spacer()
            
        }
        .bold()
        .navigationBarBackButtonHidden()
    }
    
    func touchInSide(){
        if self.number1 != "" && self.number2 != "" {
            self.add = String(Int(number1)!+Int(number2)!)
            self.sub = String(Int(number1)!-Int(number2)!)
            self.mul = String(Int(number1)!*Int(number2)!)
            
            if Int(number1)!%Int(number2)! == 0 {
                self.div = String(Int(number1)!/Int(number2)!)
            } else {
                self.div = String(format: "%.2f", Double(number1)!/Double(number2)!)
            }
        }
        isFocused = false
    }
}

#Preview {
    FourBasicOperations()
}
