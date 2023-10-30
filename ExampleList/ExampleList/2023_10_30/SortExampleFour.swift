//
//  SortExampleFour.swift
//  ExampleList
//
//  Created by 노주영 on 2023/10/30.
//

import SwiftUI

struct SortExampleFour: View {
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
            ZStack(alignment: Alignment(horizontal: .fourAlignment, vertical: .fourAlignment)) {
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 100, height: 100)
                    .alignmentGuide(HorizontalAlignment.fourAlignment) {
                        $0[.trailing]
                    }
                    .alignmentGuide(VerticalAlignment.fourAlignment) {
                        $0[.bottom]
                    }
                Rectangle()
                    .fill(Color.blue)
                    .frame(width: 50, height: 50)
                    .alignmentGuide(HorizontalAlignment.fourAlignment) {
                        $0[.leading]
                    }
                    .alignmentGuide(VerticalAlignment.fourAlignment) {
                        $0[.top]
                    }
            }
            Spacer()
        }
        .navigationBarBackButtonHidden()
    }
}

extension VerticalAlignment {
    private enum FourAlignment: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            d[VerticalAlignment.center]
        }
    }
    static let fourAlignment = VerticalAlignment(FourAlignment.self)
}

extension HorizontalAlignment {
    private enum FourAlignment: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            d[HorizontalAlignment.center]
        }
    }
    static let fourAlignment = HorizontalAlignment(FourAlignment.self)
}

#Preview {
    SortExampleFour()
}
