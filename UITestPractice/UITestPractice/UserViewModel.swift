//
//  UserViewModel.swift
//  UITestPractice
//
//  Created by 노주영 on 12/18/23.
//

import Foundation

class UserViewModel: ObservableObject {
    @Published var userLogin: User = User(name: "", password: "")
    
    @Published var isLogin = false
    
    func doLogin() -> Bool {
        guard userLogin.name == "test" && userLogin.password == "1234" else {
            return false
        }
        
        isLogin = true
        
        return true
    }
    
    func doLogout() {
        userLogin.name = ""
        userLogin.password = ""
        isLogin = false
    }
}
