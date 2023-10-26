//
//  StorageView.swift
//  ExampleList
//
//  Created by 노주영 on 2023/10/26.
//

import SwiftUI

struct StorageView: View {
    @Environment(\.scenePhase) private var scencePhase
    @Environment(\.dismiss) private var dismiss
    
    @AppStorage("sceneIndex") private var sceneIndex: Int = 0
    
    @State private var bindIndex: Int = 0
    
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
            TabView(selection: $bindIndex) {
                SceneStorageView()
                    .tabItem {
                        Image(systemName: "circle.fill")
                        Text("ScenceStorage")
                    }
                    .tag(0)
                    
                AppStorageView()
                    .tabItem {
                        Image(systemName: "square.fill")
                        Text("AppStorage")
                    }
                    .tag(1)
            }
        }
        .onAppear(perform: {
            bindIndex = sceneIndex
        })
        .onDisappear(perform: {
            sceneIndex = bindIndex
        })
        .onChange(of: scencePhase){ phase in
            switch phase {
            case .background: sceneIndex = bindIndex
            default:
                break
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    StorageView()
}
