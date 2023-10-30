//
//  SortExampleTwo.swift
//  ExampleList
//
//  Created by 노주영 on 2023/10/30.
//

import SwiftUI

struct SortExampleTwo: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var change: Bool = true
    
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
            VStack(spacing: 50) {
                Image(change ? "pretty" : "cute")
                    .resizable()
                    .frame(maxWidth: 200, maxHeight: 200)
                    .cornerRadius(20)
                    .aspectRatio(contentMode: .fit)
                
                HStack(spacing: 150) {
                    Button(action: prettyUp, label: {
                        Text("Up")
                            .modifier(StandardCustomFontText())
                            .bold()
                            .padding()
                    })
                    .frame(maxWidth: 100, maxHeight: 40)
                    .border(.gray, width: 4)
                    .cornerRadius(5)
                    
                    
                    Button(action: prettyDown, label: {
                        Text("Down")
                            .modifier(StandardCustomFontText())
                            .bold()
                            .padding()
                    })
                    .frame(maxWidth: 100, maxHeight: 40)
                    .border(.gray, width: 4)
                    .cornerRadius(5)
                }
                
                Image(change ? "cute" : "pretty")
                    .resizable()
                    .frame(maxWidth: 200, maxHeight: 200)
                    .cornerRadius(20)
                    .aspectRatio(contentMode: .fit)
            }
            .padding()
            Spacer()
        }
        .navigationBarBackButtonHidden()
    }
    func prettyUp() {
        change = true
    }
    
    func prettyDown() {
        change = false
    }
}

#Preview {
    SortExampleTwo()
}
