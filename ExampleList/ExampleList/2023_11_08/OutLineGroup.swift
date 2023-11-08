//
//  OutLineGroup.swift
//  ExampleList
//
//  Created by 노주영 on 2023/11/08.
//

import SwiftUI

struct CarInfo: Identifiable {
    let id = UUID()
    var name: String
    var image: String
    var children: [CarInfo]?
}

struct OutLineGroup: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    OutLineGroup()
}
