//
//  FontViewModifier.swift
//  ExampleList
//
//  Created by 노주영 on 2023/10/20.
//

import SwiftUI

struct StandardCustomFontTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("MaplestoryOTFBold", size: 40))
            .foregroundColor(.black)
    }
}

struct StandardCustomFontText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("MaplestoryOTFLight", size: 15))
            .foregroundColor(.black)
    }
}

struct StandardCustomSimpleTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("NotoSansKR-Bold", size: 40))
            .foregroundStyle(.black)
    }
}

struct StandardCustomSimpleText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("NotoSansKR-Regular", size: 15))
            .foregroundStyle(.black)
    }
}
