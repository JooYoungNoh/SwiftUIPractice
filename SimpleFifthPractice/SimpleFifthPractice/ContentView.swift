//
//  ContentView.swift
//  SimpleFifthPractice
//
//  Created by 노주영 on 2023/10/16.
//

import SwiftUI

struct ContentView: View {
    @State private var textFieldText: String = "Hello, World!"
    @State private var text: String = "Hello, World!"
    @FocusState private var isFocused: Bool
    
    
    var body: some View {
        VStack {
            Image("cute")
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: 1000)
                .cornerRadius(20)
                .aspectRatio(contentMode: .fit)
                .padding(.horizontal, 10)
                .padding(.top, 20)
            
            HStack{
                Button(action: {}, label: {
                    Text("Home")
                        .padding(10)
                        .modifier(StandardFontCustom())
                        .cornerRadius(5)
                })
                
                Spacer()
                Text(self.text)
                    .padding(10)
                    .font(.custom("BazziRegular", size: 25))
                
                Spacer()
                Button(action: {}, label: {
                    Text("Call")
                        .padding(10)
                        .padding(.horizontal, 10)
                        .modifier(StandardFontCustom())
                        .cornerRadius(5)
                })
            }
            .padding(.horizontal, 10)
            
            Spacer()
            
            HStack{
                TextField(self.textFieldText, text: $textFieldText)
                    .font(.custom("BazziRegular", size: 25))
                    .cornerRadius(5)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .focused($isFocused)
                    .padding(.leading, 10)
                    
                
                Button(action: self.touchInSide, label: {
                    Text("Hello Button")
                        .padding(10)
                        .modifier(StandardFontCustom())
                        .cornerRadius(5)
                })
                .padding(.trailing, 10)
            }
            .padding(.bottom, 20)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.teal)
    }
    
    func touchInSide(){
        text = textFieldText
        isFocused = false
    }
}

struct StandardFontCustom: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("BazziRegular", size: 25))
            .foregroundColor(.white)
            .background(.indigo)
    }
}

#Preview {
    ContentView()
}
