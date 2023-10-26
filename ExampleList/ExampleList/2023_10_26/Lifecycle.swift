//
//  Lifecycle.swift
//  ExampleList
//
//  Created by 노주영 on 2023/10/26.
//

import SwiftUI

struct Lifecycle: View {
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
            
            TabView {
                FirstTabView()
                    .tabItem {
                        Image(systemName: "01.circle")
                        Text("First")
                    }
                
                SecondTabView()
                    .tabItem {
                        Image(systemName: "02.circle")
                        Text("Second")
                    }
            }
        }
    }
}

#Preview {
    Lifecycle()
}
