//
//  NaviSecond.swift
//  ExampleList
//
//  Created by 노주영 on 2023/11/01.
//

import SwiftUI

struct NaviSecond: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.editMode) private var editMode
    
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
                .padding(.bottom, 40)
                
                VStack {
                    HStack {
                        Text("Navigation ex 3")
                            .modifier(StandardCustomFontTitle())
                        Spacer()
                    }
                }
                .padding(20)
                .background(changeVM.thirdChangeColor)
                .padding(.bottom, 40)
                
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
                .padding(.bottom, 20)
            }
            .frame(maxWidth: .infinity)
        }
        .toolbar { EditButton() }
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
