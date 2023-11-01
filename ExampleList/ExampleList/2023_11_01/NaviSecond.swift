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
