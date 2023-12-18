//
//  ContentView.swift
//  UITestPractice
//
//  Created by 노주영 on 12/18/23.
//

import SwiftUI

struct ContentView: View {
    @State var welcomeText: String = "로그인 해주세요"
    @State var loginText: String = "로그인"
    @State var isShow: Bool = false
    
    var body: some View {
        VStack(spacing: 30) {
            Text(welcomeText)
                .font(.title)
                .bold()
            
            Button {
                isShow.toggle()
            } label: {
                Text(loginText)
                    .padding()
                    .font(.system(size: 25, weight: .semibold))
                    .foregroundStyle(loginText == "로그인" ? .black : .red)
                    .background(Color(uiColor: .systemGray5))
                    .cornerRadius(10)
            }

        }
        .padding()
    }
}

