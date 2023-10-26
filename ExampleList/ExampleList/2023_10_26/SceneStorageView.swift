//
//  SceneStorageView.swift
//  ExampleList
//
//  Created by 노주영 on 2023/10/26.
//

import SwiftUI

struct SceneStorageView: View {
    @SceneStorage("mytext") private var editorText: String = ""
    
    var body: some View {
        VStack {
            TextEditor(text: $editorText)
                .padding(30)
        }
        .modifier(StandardCustomFontText())
    }
}

#Preview {
    SceneStorageView()
}
