//
//  UIExampleTwo.swift
//  SimpleFifthPractice
//
//  Created by 노주영 on 2023/10/16.
//

import SwiftUI

struct UIExampleTwo: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var count: Int = 0
    
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
            
            Spacer()
            Text("\(self.count)")
                .font(.custom("BazziRegular", size: 25))
                .foregroundStyle(.white)
            
            Spacer()
            Button(action: self.touchInSide, label: {
                Text("Count")
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
    
    func touchInSide(){
        count += 1
    }
}

#Preview {
    UIExampleTwo()
}
