//
//  NaviSecond.swift
//  ExampleList
//
//  Created by 노주영 on 2023/11/01.
//

import SwiftUI

struct NaviSecond: View {
    @Environment(\.editMode) private var editMode
    
    @StateObject var changeVM: ChangeVM
    
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
                    
                    TextField("첫번째 화면에 전달할 문자열", text: $changeVM.secondChangeText)
                        .font(.custom("MaplestoryOTFLight", size: 25))
                        .foregroundStyle(.black)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .multilineTextAlignment(.leading)
                        .border(.gray, width: 2)
                        .cornerRadius(5.0)
                        .padding(.horizontal, 20)
                }
                .padding(.vertical, 20)
                
                VStack {
                    HStack {
                        Text("Navigation ex 3")
                            .modifier(StandardCustomFontTitle())
                        Spacer()
                    }
                }
                .padding(20)
                .background(changeVM.thirdChangeColor)
                .padding(.vertical, 20)
                
                VStack {
                    HStack {
                        Text("Navigation ex 4")
                            .modifier(StandardCustomFontTitle())
                        Spacer()
                    }
                    .padding(20)
                    
                    if editMode?.wrappedValue.isEditing == true {
                        TextField("첫번째 화면에 전달할 문자열", text: $changeVM.fourthChangeText)
                            .font(.custom("MaplestoryOTFLight", size: 25))
                            .foregroundStyle(.black)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .multilineTextAlignment(.leading)
                            .border(.gray, width: 2)
                            .cornerRadius(5.0)
                            .padding(.horizontal, 20)
                    } else {
                        Text(changeVM.fourthChangeText)
                            .font(.custom("MaplestoryOTFLight", size: 25))
                            .foregroundStyle(.black)
                    }
                }
                .padding(.vertical, 20)
            }
            .frame(maxWidth: .infinity)
        }
        .toolbar { EditButton() }
        .navigationTitle("Second View")
        .navigationBarTitleDisplayMode(.inline)
        .onDisappear(perform: {
            //예제 1
            changeVM.firstNaviText = "First View"
        })
    }
}

#Preview {
    NaviSecond(changeVM: ChangeVM())
}
