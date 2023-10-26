//
//  ObservableSecound.swift
//  ExampleList
//
//  Created by 노주영 on 2023/10/26.
//

import SwiftUI

struct ObservableSecound: View {
    @Environment(\.dismiss) private var dismiss
    
    @EnvironmentObject var vm: ObservableVM
    
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
            VStack {
                Text("Timer Count = \(vm.timeCount)")
            }
            .padding()
            
            Spacer()
        }
        
        .modifier(StandardCustomFontTitle())
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    ObservableSecound().environmentObject(ObservableVM())
}
