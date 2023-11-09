//
//  GridPratice.swift
//  ExampleList
//
//  Created by 노주영 on 2023/11/08.
//

import SwiftUI

struct GridPratice: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var layouts: [[GridItem]] = [[GridItem()], [GridItem(), GridItem()], [GridItem(),GridItem(),GridItem()], [GridItem(),GridItem(),GridItem(),GridItem()], [GridItem(),GridItem(),GridItem(),GridItem(),GridItem()]]
    @State private var rotation: Double = 0.0
    
    var body: some View {
        
        VStack {
            HStack {
                Button(action: {dismiss()}, label: {
                    Text("< Back")
                        .font(.custom("NotoSansKR-Bold", size: 25))
                        .foregroundStyle(.black)
                        .bold()
                    
                })
                Spacer()
            }
            .padding(.horizontal, 20)
            
            Slider(value: $rotation, in: 0...4, step: 1)
                .tint(.black)
                .padding()
            
            ScrollView(.vertical) {
                LazyVGrid(columns: layouts[Int(rotation)], spacing: 5) {
                    ForEach((0...4), id: \.self) { index in
                        Text("1")
                            .frame(width: 60, height: 40)
                            .background(Color(uiColor: UIColor.systemGray2))
                            .cornerRadius(8)
                        
                    }
                }
                .padding()
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    GridPratice()
}
