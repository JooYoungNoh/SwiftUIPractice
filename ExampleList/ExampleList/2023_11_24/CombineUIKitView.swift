//
//  CombineUIKitView.swift
//  ExampleList
//
//  Created by 노주영 on 2023/11/24.
//

import SwiftUI

struct CombineUIKitView: View {
    var body: some View {
        VStack {
            MyScrollView(text: "UIView in SwiftUI")
        }
        .padding()
    }
}

#Preview {
    CombineUIKitView()
}
