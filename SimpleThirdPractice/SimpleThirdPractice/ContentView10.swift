//
//  ContentView10.swift
//  SimpleThirdPractice
//
//  Created by 노주영 on 2023/10/12.
//

import SwiftUI

struct ContentView10: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var number1: String = ""
    @State private var number2: String = ""
    @State private var result: String = "대기중..."
    @FocusState private var isFocused: Bool
    
    var body: some View {
        VStack {
            VStack {
                Text("큰 수 빼기")
                    .font(.custom("BazziRegular", size: 60))
                    .padding(20)
                
                HStack{
                    Image(systemName: "number.square")
                        .resizable(resizingMode: .tile)
                        .frame(width: 40.0, height: 40.0)
                        .foregroundStyle(.black)
                        .padding(.leading, 55)
                        .padding(5)
                    
                    TextField("ex) 10", text: $number1)
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
                    Image(systemName: "number.square")
                        .resizable(resizingMode: .tile)
                        .frame(width: 40.0, height: 40.0)
                        .foregroundStyle(.black)
                        .padding(.leading, 55)
                        .padding(5)
                    
                    TextField("ex) 30", text: $number2)
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
                            .frame(width: geometry.size.width/2, height: geometry.size.height*5/3)
                    })
                    
                    NavigationLink(destination: ContentView11(), label: {
                        Text("다음 화면")
                            .modifier(StandardCustomFont())
                            .frame(width: geometry.size.width/2, height: geometry.size.height*5/3)
                    })
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
        guard let intNum1 = Int(self.number1) else { return }
        guard let intNum2 = Int(self.number2) else { return }
        
        self.result = intNum1 > intNum2 ? "\(intNum1-intNum2)" : "\(intNum2-intNum1)"
    }
}

#Preview {
    ContentView10()
}
