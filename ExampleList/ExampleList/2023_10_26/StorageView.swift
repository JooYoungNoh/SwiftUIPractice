//
//  StorageView.swift
//  ExampleList
//
//  Created by 노주영 on 2023/10/26.
//

import SwiftUI

struct StorageView: View {
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
                SceneStorageView()
                    .tabItem {
                        Image(systemName: "circle.fill")
                        Text("ScenceStorage")
                    }
                AppStorageView()
                    .tabItem {
                        Image(systemName: "square.fill")
                        Text("AppStorage")
                    }
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    StorageView()
}
