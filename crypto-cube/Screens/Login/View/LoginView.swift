//
//  LoginView.swift
//  crypto-cube
//
//  Created by Maciej Dubowik on 27/06/2023.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var loginViewModel = LoginViewModel()
    
    var body: some View {
        NavigationView{
            VStack {
                ZStack{
                    Image("register-background")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)

                    VStack {
                        VStack {
                            Text("Sign In")
                                .foregroundColor(.white)
                                .font(Font.custom(S.Font.Lato.bold, size: 40))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Text("Sign In to your account")
                                .foregroundColor(.white)
                                .font(Font.custom(S.Font.Lato.semiBold, size: 16))
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .padding(.leading, 105)
                        .padding(.top, 10)

                        Spacer()

                        VStack {
                            VStack {
                                DefaultTextField(placeholder: "Email", text: $loginViewModel.user.email)
                                SecureTextField(placeholder: "Password", text: $loginViewModel.user.password)
                                Text(loginViewModel.message)
                                    .font(Font.custom(S.Font.Lato.regular, size: 14))
                                    .foregroundColor(.red)
                            }
                            .padding(.bottom, 30)

                            Button(action: {
                                loginViewModel.login()
                            }, label: {
                                Text("Sign In")
                                    .font(Font.custom(S.Font.Lato.semiBold, size: 19))
                                    .foregroundColor(.black)
                                    .frame(width: 342, height: 51)
                                    .background(Color(hex: S.Color.orange))
                                    .cornerRadius(10)
                            })

                            HStack {
                                Text("Don't have an account?")
                                    .font(Font.custom(S.Font.Lato.regular, size: 14))
                                    .foregroundColor(Color(hex: S.Color.lightGray))

                                NavigationLink(destination: RegistrationView(), label: {
                                    Text("Sign Up")
                                        .font(Font.custom(S.Font.Lato.regular, size: 14))
                                        .foregroundColor(Color(hex: S.Color.orange))
                                })
                            }
                            .padding(.top,14)
                            .padding(.bottom, 40)
                        }
                        .padding(.horizontal, 0)
                        .padding(.top, 50)
                        .background()
                        .frame(maxWidth: .infinity)
                    }
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
