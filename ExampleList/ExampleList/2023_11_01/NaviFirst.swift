//
//  NaviFirst.swift
//  ExampleList
//
//  Created by 노주영 on 2023/11/01.
//

import SwiftUI

class ChangeVM: ObservableObject {
    @Published var firstNaviText: String = ""            //예제 1
    @Published var secondChangeText: String = ""         //예제 2
    @Published var thirdChangeColor: Color = .blue       //예제 3
    @Published var fourthChangeText: String = "Hello"    //예제 4
    @Published var isFourthChange: Bool = false          //예제 4
}

struct NaviFirst: View {
    @Environment(\.dismiss) private var dismiss
    
    @StateObject private var changeVM: ChangeVM = ChangeVM()
    
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
                NavigationLink(destination: NaviSecond(changeVM: changeVM), label: {
                    Text("Next >")
                        .font(.custom("MaplestoryOTFLight", size: 25))
                        .foregroundStyle(.black)
                        .bold()
                })
            }
            .padding(.horizontal, 20)
            
            ScrollView {
                VStack {
                    HStack {
                        Text("Navigation ex 1")
                            .modifier(StandardCustomFontTitle())
                        Spacer()
                    }
                    .padding(20)
                    
                    Text(changeVM.firstNaviText)
                        .font(.custom("MaplestoryOTFLight", size: 25))
                        .foregroundStyle(.blue)
                }
                .padding(.bottom, 40)
                
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
                .padding(.bottom, 40)
                
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
                .padding(.bottom, 40)
            }
            .frame(maxWidth: .infinity)
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    NaviFirst()
}
