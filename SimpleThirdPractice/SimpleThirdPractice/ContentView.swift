//
//  ContentView.swift
//  SimpleThirdPractice
//
//  Created by 노주영 on 2023/10/12.
//

import SwiftUI

//예제 9
struct ContentView: View {
    @State private var number: String = ""
    @State private var result: String = ""
    @FocusState private var isFocused: Bool
    
    var body: some View {
        NavigationView{
            VStack {
                VStack {
                    Text("홀 짝")
                        .font(.custom("BazziRegular", size: 60))
                        .padding(20)
                    
                    HStack{
                        Image(systemName: "number.square")
                            .resizable(resizingMode: .tile)
                            .frame(width: 40.0, height: 40.0)
                            .foregroundStyle(.black)
                            .padding(.leading, 55)
                            .padding(5)
                        
                        TextField("ex) 10", text: $number)
                            .modifier(StandardCustomFont())
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.numberPad)
                            .multilineTextAlignment(.leading)
                            .border(.gray, width: 2)
                            .cornerRadius(5.0)
                            .padding(.trailing, 60)
                            .focused($isFocused)
                    }
                    
                    if number != "" {
                        Button(action: self.touchInSide, label: {
                            Text("↓")
                                .font(.custom("BazziRegular", size: 60))
                                .modifier(StandardCustomFont())
                                .multilineTextAlignment(.center)
                        })
                    }
                    
                    if result != ""{
                        Text("\(result)")
                            .font(.custom("BazziRegular", size: 60))
                            .modifier(StandardCustomFont())
                            .padding(20)
                    }
                }
                .padding(.top, 200)
                
                GeometryReader{ geometry in
                    HStack{
                        Text("")
                            .modifier(StandardCustomFont())
                            .frame(width: geometry.size.width/2, height: geometry.size.height*5/3)
                        
                        NavigationLink(destination: ContentView10(), label: {
                            Text("다음 화면")
                                .modifier(StandardCustomFont())
                                .frame(width: geometry.size.width/2, height: geometry.size.height*5/3+20)
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
        }
    }
    //화살표 버튼 메서드
    func touchInSide(){
        if let changeNumber = Int(self.number){
            if changeNumber > 0 {
                self.result = changeNumber%2 == 0 ? "짝수" : "홀수"
            } else {
                self.result = "0보다 커야됩니다!!"
            }
            isFocused = false
        }
    }
}

struct StandardCustomFont: ViewModifier{
    func body(content: Content) -> some View {
        content
            .font(.custom("BazziRegular", size: 30))
            .fontWeight(.bold)
            .foregroundColor(.black)
    }
}

#Preview {
    ContentView()
}
