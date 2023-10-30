//
//  SortExampleSix.swift
//  ExampleList
//
//  Created by 노주영 on 2023/10/30.
//

import SwiftUI

struct SortExampleSix: View {
    @Environment(\.dismiss) private var dismiss
    
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
            HStack(alignment: .center) {
                VStack {
                    Text("Hello")
                        .modifier(StandardCustomFontTitle())
                        .background(.red)
                        
                }
                
                VStack {
                    Text("World")
                        .modifier(StandardCustomFontText())
                        .background(.blue)
                        .alignmentGuide(HorizontalAlignment.center, computeValue: { d in
                            d[HorizontalAlignment.leading] - 180
                        })
                }
                .alignmentGuide(VerticalAlignment.center, computeValue: { d in
                    d[VerticalAlignment.bottom] - 22
                })
            }
            
            .padding()
            Spacer()
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    SortExampleSix()
}
