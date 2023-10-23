//
//  DivideSeconds.swift
//  ExampleList
//
//  Created by 노주영 on 2023/10/23.
//

import SwiftUI

struct DivideSeconds: View {
    @Environment(\.dismiss) private var dismiss
    @FocusState private var isFocused: Bool
    
    @State private var number: String = ""
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
               Text("초 나누기")
                   .modifier(StandardCustomFontTitle())
                   .padding(20)
               
               HStack{
                   Image(systemName: "clock")
                       .resizable(resizingMode: .tile)
                       .frame(width: 40.0, height: 40.0)
                       .foregroundStyle(.black)
                       .padding(.trailing, 10)
                   
                   TextField("초 입력", text: $number)
                       .modifier(StandardCustomFontText())
                       .textFieldStyle(RoundedBorderTextFieldStyle())
                       .keyboardType(.numberPad)
                       .multilineTextAlignment(.leading)
                       .border(.gray, width: 2)
                       .cornerRadius(5.0)
                       .focused($isFocused)
               }
               .padding(20)
               
               if number != "" {
                   Button(action: self.touchInSide, label: {
                       Text("↓")
                           .font(.custom("MaplestoryOTFLight", size: 50))
                           .foregroundStyle(.black)
                           .multilineTextAlignment(.center)
                   })
               }
               
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
        if let changeNumber = Int(self.number){
            let hour: String = "\(changeNumber/3600)"
            let minute: String = "\(changeNumber%3600/60)"
            let sec: String = "\(changeNumber%3600%60)"
            
            self.result = hour + "시 " + minute + "분 " + sec + "초"
            
            isFocused = false
        } else {
            self.result = ""
        }
    }
}

#Preview {
    DivideSeconds()
}
