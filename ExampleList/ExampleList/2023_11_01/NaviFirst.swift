//
//  NaviFirst.swift
//  ExampleList
//
//  Created by 노주영 on 2023/11/01.
//

import SwiftUI

class ChangeVM: ObservableObject {
    @Published var firstNaviText: String = "첫 화면"       //예제 1
    @Published var secondChangeText: String = ""         //예제 2
    @Published var thirdChangeColor: Color = .blue       //예제 3
    @Published var fourthChangeText: String = "Hello"    //예제 4
    @Published var isFourthChange: Bool = false          //예제 4
}

struct NaviFirst: View {
    @StateObject private var changeVM: ChangeVM = ChangeVM()
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    HStack {
                        Text("Navigation ex 2")
                            .modifier(StandardCustomFontTitle())
                        Spacer()
                    }
                    .padding(20)
                    
                    Text(changeVM.secondChangeText)
                        .font(.custom("MaplestoryOTFLight", size: 25))
                        .foregroundStyle(.blue)
                }
                .padding(.vertical, 20)
                
                VStack {
                    HStack {
                        Text("Navigation ex 4")
                            .modifier(StandardCustomFontTitle())
                        Spacer()
                    }
                    .padding(20)
                    
                    Text(changeVM.fourthChangeText)
                        .font(.custom("MaplestoryOTFLight", size: 25))
                        .foregroundStyle(.blue)
                }
                .padding(.vertical, 20)
            }
            .frame(maxWidth: .infinity)
        }
        .toolbar {
            NavigationLink(destination: NaviSecond(changeVM: changeVM), label: {
                Text("Next")
            })
        }
        .navigationTitle(changeVM.firstNaviText)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NaviFirst()
}
