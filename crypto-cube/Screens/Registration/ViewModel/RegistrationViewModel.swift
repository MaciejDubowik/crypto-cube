//
//  RegistrationViewModel.swift
//  crypto-cube
//
//  Created by Maciej Dubowik on 27/06/2023.
//

import Firebase
import Combine

class RegistrationViewModel: ObservableObject {

    @Published var user = User()
    @Published var repeatedPassword: String = ""
    @Published var message: String = ""
    
    func registerUser(){
        Auth.auth().createUser(withEmail: user.email, password: user.password, completion: { result, err in
            if let err = err {
                self.message = err.localizedDescription
                return
            }

            self.message = ""

            let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
            changeRequest?.displayName = self.user.name
            changeRequest?.commitChanges { err in
                if let err = err {
                    print("Failed due to error:", err)
                    return
                }
            }
        })
        print("success")
    }

    func validateAndRegister(){
        if user.name.isEmpty {
            message = "Name is empty."
        } else if user.password != repeatedPassword {
            message = "Passwords do not match."
        } else {
            registerUser()
        }
    }

}
