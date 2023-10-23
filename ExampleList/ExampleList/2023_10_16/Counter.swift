//
//  Counter.swift
//  ExampleList
//
//  Created by 노주영 on 2023/10/23.
//

import SwiftUI

struct Counter: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var count: Int = 0
    
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
            
            Spacer()
            Text("\(self.count)")
                .modifier(StandardCustomFontTitle())
                .foregroundStyle(.white)
            
            Spacer()
            Button(action: self.touchInSide, label: {
                Text("Count")
                    .padding(10)
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .modifier(StandardCustomFontTitle())
                    .cornerRadius(5)
            })
            .padding(.horizontal, 10)
            .padding(.bottom, 10)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.teal)
        .navigationBarBackButtonHidden()
    }
    
    func touchInSide(){
        count += 1
    }
}


#Preview {
    Counter()
}
