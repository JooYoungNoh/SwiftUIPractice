//
//  SortExampleFive.swift
//  ExampleList
//
//  Created by 노주영 on 2023/10/30.
//

import SwiftUI

struct SortExampleFive: View {
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
            VStack(alignment: .fiveAlignment) {
                Circle()
                    .fill(Color.green)
                    .frame(width: 50, height: 50)
                    .alignmentGuide(.fiveAlignment) {
                        $0[.trailing]
                    }
                Circle()
                    .fill(Color.yellow)
                    .frame(width: 50, height: 50)
                Circle()
                    .fill(Color.orange)
                    .frame(width: 50, height: 50)
                    .alignmentGuide(.fiveAlignment) {
                        $0[.leading]
                    }
            }
            Spacer()
        }
        .navigationBarBackButtonHidden()
    }
}

extension HorizontalAlignment {
    private enum FiveAlignment: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            d[HorizontalAlignment.center]
        }
    }
    static let fiveAlignment = HorizontalAlignment(FiveAlignment.self)
}

#Preview {
    SortExampleFive()
}
