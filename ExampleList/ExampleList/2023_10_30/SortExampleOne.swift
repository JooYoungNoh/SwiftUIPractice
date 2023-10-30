//
//  SortExampleOne.swift
//  ExampleList
//
//  Created by 노주영 on 2023/10/30.
//

import SwiftUI

struct SortExampleOne: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
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
                
                VStack(spacing: 20) {
                    Image("pretty")
                        .resizable()
                        .frame(maxWidth: 100, maxHeight: 100)
                        .cornerRadius(20)
                        .aspectRatio(contentMode: .fit)
                    
                    HStack(spacing: 20) {
                        ForEach(0..<3) { _ in
                            Image("pretty")
                                .resizable()
                                .frame(maxWidth: 100, maxHeight: 100)
                                .cornerRadius(20)
                                .aspectRatio(contentMode: .fit)
                        }
                    }
                    
                    HStack(spacing: 20) {
                        ForEach(0..<3) { _ in
                            Image("pretty")
                                .resizable()
                                .frame(maxWidth: 100, maxHeight: 100)
                                .cornerRadius(20)
                                .aspectRatio(contentMode: .fit)
                        }
                    }
                }
                .padding(.top, 20)
            }
            
            Spacer()
            HStack(spacing: 50) {
                ForEach(0..<3) { _ in
                    Button(action: {}, label: {
                        Text("Button")
                            .modifier(StandardCustomFontText())
                            .bold()
                            .padding()
                    })
                    .border(.gray, width: 4)
                    .cornerRadius(5)
                }
            }
            .padding(.bottom)
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    SortExampleOne()
}
