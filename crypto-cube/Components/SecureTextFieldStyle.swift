//
//  SecureTextFieldStyle.swift
//  crypto-cube
//
//  Created by Maciej Dubowik on 27/06/2023.
//

import SwiftUI

struct SecureTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<_Label>) -> some View {
        configuration
            .frame(width: 332, height: 51)
            .background(.white)
            .cornerRadius(10)
            .padding(.leading, 10)
            .overlay(
            RoundedRectangle(cornerRadius: 10)
                .inset(by: 0.5)
            .stroke(Color(red: 0.63, green: 0.63, blue: 0.63), lineWidth: 1)
            )
    }
}


struct SecureTextField: View {
    var placeholder: String
    @Binding var text: String

    var body: some View {
        Text(placeholder)
            .font(Font.custom(S.Font.Lato.regular, size: 14))
            .foregroundColor(Color(hex: S.Color.lightGray))
            .frame(width: 332, alignment: .leading)

        SecureField("", text: $text)
            .textFieldStyle(DefaultTextFieldStyle())
            .frame(maxWidth: .infinity)
            .padding(.bottom, 12)
            .textInputAutocapitalization(.never)
            .autocorrectionDisabled()
            .textContentType(.oneTimeCode)
    }
}
