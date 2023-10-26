//
//  Observable.swift
//  ExampleList
//
//  Created by 노주영 on 2023/10/26.
//

import SwiftUI

struct Observable: View {
    @Environment(\.dismiss) private var dismiss
    
    @StateObject private var vm: ObservableVM = ObservableVM()
    
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
                
                NavigationLink(destination: ObservableSecound(vm: vm), label: {
                    Text("Next >")
                        .font(.custom("MaplestoryOTFLight", size: 25))
                        .foregroundStyle(.black)
                        .bold()
                })
            }
            .padding(.horizontal, 20)
            
            Spacer()
            VStack {
                Text("시간 카운터 = \(vm.timeCount)")
                
                Button(action: vm.resetCount, label: {
                    Text("초기화")
                        .padding()
                })
                .border(.black, width: 5)
                .cornerRadius(3)
                .padding(.top, 50)
            }
            .modifier(StandardCustomFontTitle())
            .padding()
            
            Spacer()
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    Observable()
}
