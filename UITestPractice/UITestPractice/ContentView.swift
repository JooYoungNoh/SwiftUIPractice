//
//  ContentView.swift
//  UITestPractice
//
//  Created by 노주영 on 12/18/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: UserViewModel = UserViewModel()
    
    @State var isLogout: Bool = false
    @State var isShow: Bool = false
    
    var body: some View {
        ZStack {
            isLogout ? Color(uiColor: .systemGray3).ignoresSafeArea() : Color.white.ignoresSafeArea()
            
            VStack(spacing: 30) {
                Text(viewModel.isLogin ? "\(viewModel.userLogin.name)님 환영합니다" : "로그인 해주세요")
                    .font(.system(size: 20, weight: .bold))
                
                Button {
                    if viewModel.isLogin {
                        isLogout = true
                    } else {
                        isShow.toggle()
                    }
                } label: {
                    Text(viewModel.isLogin ? "로그아웃" : "로그인")
                        .padding()
                        .frame(width: UIScreen.main.bounds.width/3)
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundStyle(viewModel.isLogin ? .red : .black)
                        .background(Color(uiColor: .systemGray5))
                        .cornerRadius(10)
                }
                .accessibilityIdentifier("loginButton")
            }
            .padding()
            .sheet(isPresented: $isShow) {
                LoginView(viewModel: viewModel, isShow: $isShow)
            }
            
            if isLogout {
                VStack(spacing: 50){
                    Text("로그아웃 하시겠습니까?")
                        .font(.system(size: 20, weight: .bold))
                    
                    HStack {
                        Button {
                            isLogout = false
                        } label: {
                            Text("돌아가기")
                                .padding()
                                .font(.system(size: 20, weight: .semibold))
                                .foregroundStyle(.black)
                                .background(Color(uiColor: .systemGray5))
                                .cornerRadius(10)
                        }
                        
                        Button {
                            viewModel.doLogout()
                            isLogout = false
                        } label: {
                            Text("로그아웃")
                                .padding()
                                .font(.system(size: 20, weight: .semibold))
                                .foregroundStyle(.red)
                                .background(Color(uiColor: .systemGray5))
                                .cornerRadius(10)
                        }
                    }
                }
                .padding(50)
                .background(.white)
                .cornerRadius(10)
            }
        }
    }
}

