//
//  FirstTabView.swift
//  ExampleList
//
//  Created by 노주영 on 2023/10/26.
//

import SwiftUI

struct FirstTabView: View {
    var body: some View {
        VStack {
            Text("View One")
                .onAppear(perform: {
                    print("onAppear triggered")
                })
                .onDisappear(perform: {
                    print("onDisappeared triggered")
                })
        }
    }
}

#Preview {
    FirstTabView()
}
