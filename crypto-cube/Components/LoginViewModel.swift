//
//  LoginViewModel.swift
//  crypto-cube
//
//  Created by Maciej Dubowik on 27/06/2023.
//

import Firebase
import Combine

class LoginViewModel: ObservableObject {
    @Published var user = User()
    @Published var message = ""

    func login() {
        Auth.auth().signIn(withEmail: user.email, password: user.password) { (result, err) in
            if let err = err {
                self.message = "Incorrect email or password."
                return
            } else {
                print("success")
            }
        }

    }
}
