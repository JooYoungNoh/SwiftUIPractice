//
//  NaviSecond.swift
//  ExampleList
//
//  Created by 노주영 on 2023/11/01.
//

import SwiftUI

struct NaviSecond: View {
    @Environment(\.dismiss) private var dismiss
    
    @StateObject var changeVM: ChangeVM
    
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
            
            ScrollView {
                VStack {
                    HStack {
                        Text("Navigation ex 2")
                            .modifier(StandardCustomFontTitle())
                        Spacer()
                    }
                    .padding(20)
                    
                    TextField("첫번째 화면에 전달할 문자열", text: $changeVM.secondChangeText)
                        .font(.custom("MaplestoryOTFLight", size: 25))
                        .foregroundStyle(.black)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .multilineTextAlignment(.leading)
                        .border(.gray, width: 2)
                        .cornerRadius(5.0)
                        .padding(.horizontal, 20)
                }
                .padding(.bottom, 20)
                
                VStack {
                    HStack {
                        Text("Navigation ex 3")
                            .modifier(StandardCustomFontTitle())
                        Spacer()
                    }
                }
                .padding(20)
                .background(changeVM.thirdChangeColor)
            }
            .frame(maxWidth: .infinity)
        }
        .navigationBarBackButtonHidden()
        .onDisappear(perform: {
            //예제 1
            changeVM.firstNaviText = "First View"
        })
    }
}

#Preview {
    NaviSecond(changeVM: ChangeVM())
}
