//
//  StorageView.swift
//  ExampleList
//
//  Created by 노주영 on 2023/10/26.
//

import SwiftUI

class colorVM: ObservableObject {
    @Published var colorSelect: Color = .white
    
    func changeStr(_ color: Color) -> [CGFloat] {
        if let rgb = color.cgColor?.components {
            return rgb
        }
        return []
    }
    
    func changeColor(_ str: String) -> Color {
        let strArr = str.components(separatedBy: " ")
        print(str)
        return Color(red: Double(strArr[0]) ?? 1, green: Double(strArr[1]) ?? 1, blue: Double(strArr[2]) ?? 1)
    }
}

struct StorageView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.scenePhase) private var scencePhase
    
    @AppStorage("myColor") private var saveColor: String = "1 1 1"
    @AppStorage("sceneIndex") private var sceneIndex: Int = 0
    
    @State private var bindIndex: Int = 0
    @StateObject private var vm: colorVM = colorVM()
    
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
    
            ColorPicker(selection: $vm.colorSelect, supportsOpacity: false, label: {})
            .frame(width: 300, height: 300)
            
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
        .background(vm.colorSelect)
        .modifier(StandardCustomFontText())
        
        .onAppear(perform: {
            bindIndex = sceneIndex
            vm.colorSelect = vm.changeColor(saveColor)
        })
        .onDisappear(perform: {
            sceneIndex = bindIndex
            print(vm.changeStr(vm.colorSelect))
            saveColor = "\(vm.changeStr(vm.colorSelect)[0]) \(vm.changeStr(vm.colorSelect)[1]) \(vm.changeStr(vm.colorSelect)[2])"
        })
        .onChange(of: scencePhase){ phase in
            switch phase {
            case .background: 
                sceneIndex = bindIndex
                saveColor = "\(vm.changeStr(vm.colorSelect)[0]) \(vm.changeStr(vm.colorSelect)[1]) \(vm.changeStr(vm.colorSelect)[2])"
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
