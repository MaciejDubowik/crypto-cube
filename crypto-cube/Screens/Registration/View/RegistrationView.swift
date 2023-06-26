//
//  RegistrationView.swift
//  crypto-cube
//
//  Created by Maciej Dubowik on 26/06/2023.
//

import SwiftUI

struct RegistrationView: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""

    var body: some View {
        VStack {

            ZStack{
                Image("register-background")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)

                VStack {
                    VStack{
                        Text("Register")
                            .foregroundColor(.white)
                            .font(.system(size: 40))

                        Text("Create your account")
                            .foregroundColor(.white)
                            .font(.system(size: 15))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 102)
                    .padding(.top, 10)


                    Spacer()

                    VStack {

                        VStack {
                            DefaultTextField(placeholder: "Name", text: $name)
                            DefaultTextField(placeholder: "Email", text: $email)
                            DefaultTextField(placeholder: "Password", text: $password)
                            DefaultTextField(placeholder: "Confirm Passowrd", text: $confirmPassword)
                        }.padding(.bottom, 30)

                        Button(action: {
                            print("register")
                        }, label: {
                            Text("Register")
                                .foregroundColor(.black)
                                .frame(width: 342, height: 51)
                                .background(Color(red: 1, green: 0.65, blue: 0))
                                .cornerRadius(10)
                        })


                        HStack{
                            Text("Have an account?")
                            .font(Font.custom("Lato", size: 14))
                            .foregroundColor(Color(red: 0.63, green: 0.63, blue: 0.63))

                            Button(action: {
                                print("go to login")
                            }, label: {
                                Text("Login")
                                    .font(Font.custom("Lato", size: 14))
                                    .foregroundColor(Color(red: 1, green: 0.65, blue: 0))

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
    }

}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
