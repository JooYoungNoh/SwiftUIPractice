//
//  SortExampleThree.swift
//  ExampleList
//
//  Created by 노주영 on 2023/10/30.
//

import SwiftUI

struct SortExampleThree: View {
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
            VStack {
                HStack(alignment: .threeAlignment) {
                    Text("Hello")
                        .modifier(StandardCustomFontTitle())
                    Text("World")
                        .modifier(StandardCustomFontText())
                }
                
            }
            Spacer()
        }
        .navigationBarBackButtonHidden()
    }
}

extension VerticalAlignment {
    private enum ThreeAlignment: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            d[.bottom]
        }
    }
    static let threeAlignment = VerticalAlignment(ThreeAlignment.self)
}

#Preview {
    SortExampleThree()
}
