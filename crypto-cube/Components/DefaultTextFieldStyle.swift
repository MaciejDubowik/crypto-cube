//
//  DefaultTextFieldStyle.swift
//  crypto-cube
//
//  Created by Maciej Dubowik on 26/06/2023.
//

import SwiftUI


struct DefaultTextFieldStyle: TextFieldStyle {
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


struct DefaultTextField: View {
    var placeholder: String
    @Binding var text: String

    var body: some View {
        Text(placeholder)
            .font(Font.custom("Lato", size: 14))
            .foregroundColor(Color(red: 0.63, green: 0.63, blue: 0.63))
            .frame(width: 332, alignment: .leading)

        TextField("", text: $text)
            .textFieldStyle(DefaultTextFieldStyle())
            .frame(maxWidth: .infinity)
            .padding(.bottom, 12)
            .textInputAutocapitalization(.never)
            .autocorrectionDisabled()
    }
}

//struct DefaultTextFieldView_Previews: PreviewProvider {
//    static var previews: some View {
//        DefaultTextField()
//    }
//}


