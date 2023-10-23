//
//  Arrangement.swift
//  ExampleList
//
//  Created by 노주영 on 2023/10/23.
//

import SwiftUI

struct Arrangement: View {
    @Environment(\.dismiss) private var dismiss
    
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
            
            Button(action: {}, label: {
                Text("Button")
                    .padding(10)
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .modifier(StandardCustomFontTitle())
                    .cornerRadius(5)
            })
            .background(.indigo)
            .padding(.horizontal, 10)
            .padding(.top, 10)
            
            Spacer()
            Button(action: {}, label: {
                Text("Button")
                    .padding(10)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .modifier(StandardCustomFontTitle())
                    .cornerRadius(5)
            })
            .background(.indigo)
            .padding(.vertical, 40)
            .padding(.horizontal, 10)
            
            Spacer()
            Button(action: {}, label: {
                Text("Button")
                    .padding(10)
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .modifier(StandardCustomFontTitle())
                    .cornerRadius(5)
            })
            .background(.indigo)
            .padding(.horizontal, 10)
            .padding(.bottom, 10)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.teal)
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    Arrangement()
}
