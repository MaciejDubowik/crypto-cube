//
//  RegistrationView.swift
//  crypto-cube
//
//  Created by Maciej Dubowik on 26/06/2023.
//

import SwiftUI

struct RegistrationView: View {
    @ObservedObject var registrationViewModel = RegistrationViewModel()
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        VStack {
            ZStack{
                Image("register-background")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)

                VStack {
                    VStack {
                        Text("Sign Up")
                            .foregroundColor(.white)
                            .font(Font.custom(S.Font.Lato.bold, size: 40))
                            .frame(maxWidth: .infinity, alignment: .leading)

                        Text("Create your account")
                            .foregroundColor(.white)
                            .font(Font.custom(S.Font.Lato.semiBold, size: 16))
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(.leading, 105)
                    .padding(.top, 10)

                    Spacer()

                    VStack {
                        VStack {
                            DefaultTextField(placeholder: "Name", text: $registrationViewModel.user.name)
                            DefaultTextField(placeholder: "Email", text: $registrationViewModel.user.email)
                            SecureTextField(placeholder: "Password", text: $registrationViewModel.user.password)
                            SecureTextField(placeholder: "Confirm Password", text: $registrationViewModel.repeatedPassword)            .textContentType(.password)

                            Text(registrationViewModel.message)
                                .font(Font.custom(S.Font.Lato.regular, size: 14))
                                .foregroundColor(.red)
                        }
                        .padding(.bottom, 30)

                        Button(action: {
                            print("register")
                            registrationViewModel.validateAndRegister()
                        }, label: {
                            Text("Sign Up")
                                .font(Font.custom(S.Font.Lato.semiBold, size: 19))
                                .foregroundColor(.black)
                                .frame(width: 342, height: 51)
                                .background(Color(hex: S.Color.orange))
                                .cornerRadius(10)
                        })

                        HStack {
                            Text("Have an account?")
                                .font(Font.custom(S.Font.Lato.regular, size: 14))
                                .foregroundColor(Color(hex: S.Color.lightGray))

                            Button(action: {
                                dismiss()
                            }, label: {
                                Text("Sign In")
                                    .font(Font.custom(S.Font.Lato.regular, size: 14))
                                    .foregroundColor(Color(hex: S.Color.orange))
                            })
                        }
                        .padding(.top,14)
                        .padding(.bottom, 40)
                    }
                    .padding(.top, 50)
                    .background()
                    .frame(maxWidth: .infinity)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
