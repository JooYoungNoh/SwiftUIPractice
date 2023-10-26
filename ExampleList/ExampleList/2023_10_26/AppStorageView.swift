//
//  AppStorageView.swift
//  ExampleList
//
//  Created by 노주영 on 2023/10/26.
//

import SwiftUI

struct AppStorageView: View {
    @AppStorage("apptext") private var editorText: String = ""
    
    @StateObject var vm: colorVM
    
    var body: some View {
        VStack {
            TextEditor(text: $editorText)
                .border(.gray, width: 3)
                .cornerRadius(5)
                .padding(20)
        }
        .modifier(StandardCustomFontText())
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(vm.colors[vm.colorIndex])
    }
}

#Preview {
    AppStorageView(vm: colorVM())
}
