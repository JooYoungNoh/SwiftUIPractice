//
//  LoginView.swift
//  UITestPractice
//
//  Created by 노주영 on 12/18/23.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel: UserViewModel
    
    @Binding var isShow: Bool
    
    var body: some View {
        VStack(spacing: 30) {
            HStack {
                Button {
                    viewModel.userLogin.name = ""
                    viewModel.userLogin.password = ""
                    isShow.toggle()
                } label: {
                    Image(systemName: "xmark")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundStyle(.black)
                }
                Spacer()
            }
            .padding(.top, 20)
            
            Spacer()
            
            HStack(spacing: 20) {
                Image(systemName: viewModel.userLogin.name == "" ? "person" : "person.fill")
                    .resizable()
                    .frame(width: 25, height: 30)
                
                TextField("이름", text: $viewModel.userLogin.name)
                    .padding()
                    .font(.system(size: 15, weight: .semibold))
                    .background(Color(uiColor: .systemGray5))
                    .cornerRadius(10)
            }
            .padding(.horizontal, 20)
            
            HStack(spacing: 20) {
                Image(systemName: viewModel.userLogin.password == "" ? "lock" : "lock.fill")
                    .resizable()
                    .frame(width: 25, height: 30)
                
                SecureField("비밀번호", text: $viewModel.userLogin.password)
                    .padding()
                    .font(.system(size: 15, weight: .semibold))
                    .background(Color(uiColor: .systemGray5))
                    .cornerRadius(10)
            }
            .padding(.horizontal, 20)

            Button {
                if viewModel.doLogin() {
                    isShow.toggle()
                }
            } label: {
                Text("로그인")
                    .padding()
                    .frame(width: UIScreen.main.bounds.width/3)
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundStyle(.black)
                    .background(Color(uiColor: .systemGray5))
                    .cornerRadius(10)
            }
            Spacer()
        }
        .padding(.horizontal, 20)
    }
}
