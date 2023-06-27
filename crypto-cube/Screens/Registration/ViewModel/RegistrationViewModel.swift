//
//  RegistrationViewModel.swift
//  crypto-cube
//
//  Created by Maciej Dubowik on 27/06/2023.
//

import Firebase

class RegistrationViewModel {
    
    func registerUser(name: String, email: String, password: String){
        Auth.auth().createUser(withEmail: email, password: password, completion: { result, err in
            if let err = err {
                print("Failed due to error:", err)
                return
            }
            print("Successfully created account with ID: \(result?.user.uid ?? "")")
            let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
            changeRequest?.displayName = name
            changeRequest?.commitChanges { err in
                if let err = err {
                    print("Failed due to error:", err)
                    return
                }
                print("name: \(name)")
            }
        })

    }

}
