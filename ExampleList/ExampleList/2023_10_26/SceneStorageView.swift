//
//  SceneStorageView.swift
//  ExampleList
//
//  Created by 노주영 on 2023/10/26.
//

import SwiftUI

struct SceneStorageView: View {
    @AppStorage("mytext") private var editorText: String = ""
    
    @StateObject var vm: colorVM
    
    var body: some View {
        VStack {
            TextField("입력해주세요~", text: $editorText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .border(.gray, width: 3)
                .cornerRadius(5)
                .modifier(StandardCustomFontTitle())
                .padding(20)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(vm.colorSelect)
    }
}

#Preview {
    SceneStorageView(vm: colorVM())
}
