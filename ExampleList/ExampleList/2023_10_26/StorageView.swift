//
//  StorageView.swift
//  ExampleList
//
//  Created by 노주영 on 2023/10/26.
//

import SwiftUI

class colorVM: ObservableObject {
    @Published var colorIndex = 0
    
    var colorNames: [String] = ["white", "Black", "Red", "Green", "Blue", "Yellow", "Cyan"]
    var colors: [Color] = [.white, .black, .red, .green, .blue, .yellow, .cyan]
}

struct StorageView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.scenePhase) private var scencePhase
    
    @AppStorage("myColor") private var saveColor: Int = 0
    @AppStorage("sceneIndex") private var sceneIndex: Int = 0
    
    @State private var bindIndex: Int = 0
    @StateObject private var vm: colorVM = colorVM()
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {dismiss()}, label: {
                    Text("< Back")
                        .font(.custom("MaplestoryOTFLight", size: 25))
                        .foregroundStyle(vm.colorIndex == 1 ? .white : .black)
                        .bold()
                })
                Spacer()
                
            }
            .padding(.horizontal, 20)
            
            Picker(selection: $vm.colorIndex, label: Text("Color")){
                ForEach(0..<vm.colorNames.count, id: \.self) {
                    Text(vm.colorNames[$0])
                        .font(.custom("MaplestoryOTFBold", size: 40))
                        .foregroundStyle(vm.colors[$0])
                }
            }
            .background(.gray)
            .opacity(0.8)
            .cornerRadius(30)
            .pickerStyle(.wheel)
            .padding(.vertical, 10)
            .padding(.horizontal, 20)
            
            Spacer()
            TabView(selection: $bindIndex) {
                SceneStorageView(vm: vm)
                    .tabItem {
                        Image(systemName: "circle.fill")
                        Text("ScenceStorage")
                    }
                    .tag(0)
                    
                AppStorageView(vm: vm)
                    .tabItem {
                        Image(systemName: "square.fill")
                        Text("AppStorage")
                    }
                    .tag(1)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(vm.colors[vm.colorIndex])
        .modifier(StandardCustomFontText())
        
        .onAppear(perform: {
            bindIndex = sceneIndex
            vm.colorIndex = saveColor
        })
        .onDisappear(perform: {
            sceneIndex = bindIndex
            saveColor = vm.colorIndex
        })
        .onChange(of: scencePhase){ phase in
            switch phase {
            case .background: 
                sceneIndex = bindIndex
                saveColor = vm.colorIndex
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
