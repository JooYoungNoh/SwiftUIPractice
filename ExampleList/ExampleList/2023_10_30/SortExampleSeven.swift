//
//  SortExampleSeven.swift
//  ExampleList
//
//  Created by 노주영 on 2023/10/30.
//

import SwiftUI

struct SortExampleSeven: View {
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
                Image("pretty")
                    .resizable()
                    .frame(maxWidth: 100, maxHeight: 100)
                    .cornerRadius(20)
                    .aspectRatio(contentMode: .fit)
                    .alignmentGuide(VerticalAlignment.center){
                        $0[VerticalAlignment.bottom] + 30
                    }
                Image("pretty")
                    .resizable()
                    .frame(maxWidth: 100, maxHeight: 100)
                    .cornerRadius(20)
                    .aspectRatio(contentMode: .fit)
                Image("pretty")
                    .resizable()
                    .frame(maxWidth: 100, maxHeight: 100)
                    .cornerRadius(20)
                    .aspectRatio(contentMode: .fit)
                    .alignmentGuide(VerticalAlignment.center){
                        $0[VerticalAlignment.top] - 30
                    }
                
            }
            Spacer()
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    SortExampleSeven()
}
