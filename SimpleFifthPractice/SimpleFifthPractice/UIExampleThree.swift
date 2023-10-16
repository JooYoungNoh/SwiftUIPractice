//
//  UIExampleThree.swift
//  SimpleFifthPractice
//
//  Created by 노주영 on 2023/10/16.
//

import SwiftUI

struct UIExampleThree: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack{
            HStack{
                Button(action: {dismiss()}, label: {
                    Label("Back", systemImage: "arrowshape.backward.fill")
                        .padding(5)
                        .modifier(StandardFontCustom())
                        .cornerRadius(5)
                })
                .padding(.leading, 10)
                .padding(.top, 10)
                Spacer()
            }
            
            Button(action: {}, label: {
                Text("Button")
                    .padding(10)
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .modifier(StandardFontCustom())
                    .cornerRadius(5)
            })
            .padding(.horizontal, 10)
            .padding(.top, 10)
            
            Spacer()
            Button(action: {}, label: {
                Text("Button")
                    .padding(10)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .modifier(StandardFontCustom())
                    .cornerRadius(5)
            })
            .padding(.vertical, 40)
            .padding(.horizontal, 10)
            
            Spacer()
            Button(action: {}, label: {
                Text("Button")
                    .padding(10)
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .modifier(StandardFontCustom())
                    .cornerRadius(5)
            })
            .padding(.horizontal, 10)
            .padding(.bottom, 10)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.teal)
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    UIExampleThree()
}
