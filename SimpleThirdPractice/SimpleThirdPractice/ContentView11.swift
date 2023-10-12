//
//  ContentView11.swift
//  SimpleThirdPractice
//
//  Created by 노주영 on 2023/10/12.
//

import SwiftUI

struct ContentView11: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var ball: String = ""
    @State private var box: String = ""
    @State private var result: String = "대기중..."
    @FocusState private var isFocused: Bool
    
    var body: some View {
        VStack {
            VStack {
                Text("상자의 개수")
                    .font(.custom("BazziRegular", size: 60))
                    .padding(20)
                
                HStack{
                    Image(systemName: "basketball")
                        .resizable(resizingMode: .tile)
                        .frame(width: 40.0, height: 40.0)
                        .foregroundStyle(.black)
                        .padding(.leading, 55)
                        .padding(5)
                    TextField("농구공의 개수", text: $ball)
                        .font(.custom("BazziRegular", size: 25))
                        .modifier(StandardCustomFont())
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numberPad)
                        .multilineTextAlignment(.leading)
                        .border(.gray, width: 2)
                        .cornerRadius(5.0)
                        .padding(.trailing, 60)
                        .focused($isFocused)
                }
                
                HStack{
                    Image(systemName: "shippingbox")
                        .resizable(resizingMode: .tile)
                        .frame(width: 40.0, height: 40.0)
                        .foregroundStyle(.black)
                        .padding(.leading, 55)
                        .padding(5)
                    
                    TextField("한 상자 넣을 공의 개수", text: $box)
                        .font(.custom("BazziRegular", size: 25))
                        .modifier(StandardCustomFont())
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numberPad)
                        .multilineTextAlignment(.leading)
                        .border(.gray, width: 2)
                        .cornerRadius(5.0)
                        .padding(.trailing, 60)
                        .focused($isFocused)
                }
                
                Button(action: self.touchInSide, label: {
                    Text("↓")
                        .font(.custom("BazziRegular", size: 60))
                        .modifier(StandardCustomFont())
                        .multilineTextAlignment(.center)
                })
                
                Text("\(result)")
                    .font(.custom("BazziRegular", size: 60))
                    .modifier(StandardCustomFont())
                    .padding(20)
            }
            .padding(.top, 120)
            
            GeometryReader{ geometry in
                HStack{
                    Button(action: {dismiss()}, label: {
                        Text("이전 화면")
                            .modifier(StandardCustomFont())
                            .frame(minWidth: geometry.size.width/2, maxWidth: geometry.size.width/2, minHeight: geometry.size.height*5/3, maxHeight: geometry.size.height*5/3)
                    })
                    
                    Text("")
                        .modifier(StandardCustomFont())
                        .frame(minWidth: geometry.size.width/2, maxWidth: geometry.size.width/2, minHeight: geometry.size.height*5/3, maxHeight: geometry.size.height*5/3)
                }
            }
        }
        .background(Image("skyGlass")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .opacity(0.6)
            .ignoresSafeArea())
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
    ContentView11()
}
