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
    
    @State private var isfail: Bool = false
    
    var body: some View {
        ZStack {
            isfail ? Color(uiColor: .systemGray3).ignoresSafeArea() : Color.white.ignoresSafeArea()
            
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
                        .accessibilityIdentifier("이름")
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
                    } else {
                        isfail = true
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
                .accessibilityIdentifier("login")
                Spacer()
            }
            .padding(.horizontal, 20)
            
            if isfail {
                if viewModel.userLogin.name != "test" {
                    VStack(spacing: 20){
                        Text("아이디가 틀립니다")
                            .font(.system(size: 20, weight: .bold))
                        
                        Text("다시 입력해주세요")
                            .font(.system(size: 15, weight: .bold))
                            .foregroundStyle(.gray)
                        
                        Button {
                            isfail = false
                        } label: {
                            Text("확인")
                                .padding()
                                .frame(width: UIScreen.main.bounds.width - 80)
                                .font(.system(size: 20, weight: .semibold))
                                .foregroundStyle(.black)
                                .background(Color(uiColor: .systemGray5))
                                .cornerRadius(10)
                        }
                        .padding(.top, 30)
                        .accessibilityIdentifier("nameYes")
                    }
                    .padding(.top, 10)
                    .padding(20)
                    .background(.white)
                    .cornerRadius(10)
                    .onTapGesture {
                        
                    }
                } else {
                    if viewModel.userLogin.password != "1234" {
                        VStack(spacing: 20){
                            Text("비밀번호가 틀립니다")
                                .font(.system(size: 20, weight: .bold))
                            
                            Text("다시 입력해주세요")
                                .font(.system(size: 15, weight: .bold))
                                .foregroundStyle(.gray)
                            
                            Button {
                                isfail = false
                            } label: {
                                Text("확인")
                                    .padding()
                                    .frame(width: UIScreen.main.bounds.width - 80)
                                    .font(.system(size: 20, weight: .semibold))
                                    .foregroundStyle(.black)
                                    .background(Color(uiColor: .systemGray5))
                                    .cornerRadius(10)
                            }
                            .padding(.top, 30)
                            .accessibilityIdentifier("passwordYes")
                        }
                        .padding(.top, 10)
                        .padding(20)
                        .background(.white)
                        .cornerRadius(10)
                        .onTapGesture {
                            
                        }
                    }
                }
            }
        }
        .onTapGesture {
            if isfail {
                isfail = false
                UIApplication.shared.closeKeyboard()
            }
        }
    }
}
