//
//  SecondTabView.swift
//  ExampleList
//
//  Created by 노주영 on 2023/10/26.
//

import SwiftUI

struct SecondTabView: View {
    @State private var text: String = ""
    
    var body: some View {
        VStack {
            TextEditor(text: $text)
                .padding()
                .onChange(of: text){
                    print("onChange triggered")
                }
        }
    }
}

#Preview {
    SecondTabView()
}
