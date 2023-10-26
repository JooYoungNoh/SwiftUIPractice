//
//  AppStorageView.swift
//  ExampleList
//
//  Created by 노주영 on 2023/10/26.
//

import SwiftUI

struct AppStorageView: View {
    @AppStorage("apptext") private var editorText: String = ""
    
    var body: some View {
        VStack {
            TextEditor(text: $editorText)
                .padding(30)
        }
        .modifier(StandardCustomFontText())
    }
}

#Preview {
    AppStorageView()
}
