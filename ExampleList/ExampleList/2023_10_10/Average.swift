//
//  Average.swift
//  ExampleList
//
//  Created by 노주영 on 2023/10/20.
//

import SwiftUI

struct Average: View {
    @Environment(\.dismiss) private var dismiss
    @FocusState private var isFocused: Bool
    
    @State private var swiftNum: String = ""
    @State private var iosNum: String = ""
    @State private var webNum: String = ""
    
    @State private var result: String = ""
    
    var body: some View {
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
                Text("평균 구하기")
                    .modifier(StandardCustomFontTitle())
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 20)
                
                HStack{
                    Text("Swift")
                        .font(.custom("MaplestoryOTFLight", size: 25))
                        .bold()
                        .frame(width: 80, height: 30)
                    
                    TextField("점수", text: $swiftNum)
                        .modifier(StandardCustomFontText())
                        .multilineTextAlignment(.leading)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .border(.gray, width: 2)
                        .cornerRadius(5.0)
                        .keyboardType(.numberPad)
                        .focused($isFocused)
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                
                HStack{
                    Text("iOS")
                        .font(.custom("MaplestoryOTFLight", size: 25))
                        .bold()
                        .frame(width: 80, height: 30)
                    
                    TextField("점수", text: $iosNum)
                        .modifier(StandardCustomFontText())
                        .multilineTextAlignment(.leading)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .border(.gray, width: 2)
                        .cornerRadius(5.0)
                        .keyboardType(.numberPad)
                        .focused($isFocused)
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                
                HStack{
                    Text("Web")
                        .font(.custom("MaplestoryOTFLight", size: 25))
                        .bold()
                        .frame(width: 80, height: 30)
                    
                    TextField("점수", text: $webNum)
                        .modifier(StandardCustomFontText())
                        .multilineTextAlignment(.leading)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .border(.gray, width: 2)
                        .cornerRadius(5.0)
                        .keyboardType(.numberPad)
                        .focused($isFocused)
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                
                Button(action: self.touchInSide, label: {
                    if self.swiftNum != "" && self.iosNum != "" && self.webNum != "" {
                        Text("↓")
                            .font(.custom("MaplestoryOTFLight", size: 50))
                            .foregroundStyle(.black)
                            .multilineTextAlignment(.center)
                    }
                })
                
                Text(result)
                    .modifier(StandardCustomFontTitle())
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 30)
            }
            Spacer()
        }
        .navigationBarBackButtonHidden()
    }
    func touchInSide(){
        isFocused = false
        guard let changeSwift = Double(self.swiftNum) else { return }
        guard let changeiOS = Double(self.iosNum) else { return }
        guard let changeWeb = Double(self.webNum) else { return }
        let add = changeSwift+changeiOS+changeWeb
        
        if add.truncatingRemainder(dividingBy: 3.0) == 0 {
            self.result = "\(Int(add/3))"
        } else {
            self.result = String(format: "%.2f", add/3)
        }
    }
}


#Preview {
    Average()
}
