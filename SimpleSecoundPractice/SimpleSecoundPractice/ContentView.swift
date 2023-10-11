//
//  ContentView.swift
//  SimpleSecoundPractice
//
//  Created by 노주영 on 2023/10/11.
//

import SwiftUI

//예제 6
struct ContentView: View {
    @State private var number: String = ""
    @State private var result: String = ""
    
    @FocusState private var isFocused: Bool
    
   var body: some View {
        VStack {
            Text("초 나누기")
                .font(.custom("YanoljaYacheB", size: 60))
                .padding(20)
            
            HStack{
                Image(systemName: "clock")
                    .resizable(resizingMode: .tile)
                    .frame(width: 40.0, height: 50.0)
                    .foregroundStyle(.black)
                    .padding(.leading, 50)
                    .padding(10)
                
                TextField("초 입력", text: $number)
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
            
            if number != "" {
                Button(action: self.touchInSide, label: {
                    Text("↓")
                        .font(.custom("YanoljaYacheB", size: 60))
                        .modifier(StandardCustomFont())
                        .multilineTextAlignment(.center)
                })
            }
            
            Text("\(result)")
                .font(.custom("YanoljaYacheB", size: 60))
                .modifier(StandardCustomFont())
                .padding(20)
        }
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

struct StandardCustomFont: ViewModifier{
    func body(content: Content) -> some View {
        content
            .font(.custom("YanoljaYacheB", size: 30))
            .fontWeight(.bold)
            .foregroundColor(.black)
    }
}

#Preview {
    ContentView()
}
