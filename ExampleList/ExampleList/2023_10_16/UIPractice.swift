//
//  UIPractice.swift
//  ExampleList
//
//  Created by 노주영 on 2023/10/23.
//

import SwiftUI

struct UIPractice: View {
    @Environment(\.dismiss) private var dismiss
    @FocusState private var isFocused: Bool
    
    @State private var textFieldText: String = "Hello, World!"
    @State private var text: String = "Hello, World!"
    
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
            
            VStack {
                Image("cute")
                    .resizable()
                    .frame(maxWidth: .infinity, maxHeight: 1000)
                    .cornerRadius(20)
                    .aspectRatio(contentMode: .fit)
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                
                HStack{
                    Button(action: {}, label: {
                        Text("Home")
                            .padding(10)
                            .font(.custom("MaplestoryOTFLight", size: 25))
                            .foregroundStyle(.white)
                            .cornerRadius(10)
                    })
                    .background(.indigo)
                    
                    Spacer()
                    Text(self.text)
                        .padding(10)
                        .font(.custom("MaplestoryOTFLight", size: 25))
                        .foregroundStyle(.white)
                    
                    Spacer()
                    Button(action: {}, label: {
                        Text("Call")
                            .padding(10)
                            .padding(.horizontal, 10)
                            .font(.custom("MaplestoryOTFLight", size: 25))
                            .foregroundStyle(.white)
                            .cornerRadius(5)
                    })
                    .background(.indigo)
                }
                .padding(.horizontal, 20)
                
                Spacer()
                
                HStack{
                    TextField(self.textFieldText, text: $textFieldText)
                        .modifier(StandardCustomFontText())
                        .cornerRadius(5)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .focused($isFocused)
                        .padding(.leading, 20)
                        
                    
                    Button(action: self.touchInSide, label: {
                        Text("Hello Button")
                            .padding(10)
                            .font(.custom("MaplestoryOTFLight", size: 15))
                            .foregroundStyle(.white)
                            .cornerRadius(5)
                    })
                    .background(.indigo)
                    .padding(.trailing, 20)
                }
                .padding(.bottom, 20)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.teal)
        .navigationBarBackButtonHidden()
    }
    
    func touchInSide(){
        text = textFieldText
        isFocused = false
    }
}

#Preview {
    UIPractice()
}
