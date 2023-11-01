//
//  DivSection.swift
//  ExampleList
//
//  Created by 노주영 on 2023/11/01.
//

import SwiftUI

struct DivSection: View {
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
            
            Text("List Quiz 2")
                .modifier(StandardCustomFontTitle())
                .padding()
            
            List {
                ForEach(1..<6) { i in
                    Section(content: {
                        ForEach(1..<4) { j in
                            Text("Item \(j)")
                                .font(.custom("MaplestoryOTFLight", size: 15))
                                .foregroundStyle(.blue)
                                .bold()
                                .padding(.vertical)
                        }
                    }, header: {
                        Text("Section \(i)")
                            .font(.custom("MaplestoryOTFLight", size: 25))
                            .foregroundStyle(.black)
                            .bold()
                    })
                }
            }
            .frame(maxWidth: .infinity)
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    DivSection()
}
