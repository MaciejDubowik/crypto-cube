//
//  SearchBar.swift
//  crypto-cube
//
//  Created by Maciej Dubowik on 11/07/2023.
//

import SwiftUI

struct SearchBarView: View {
    @ObservedObject var viewModel: SearchBarViewModel
    
    var body: some View {
        HStack {
            TextField("", text: $viewModel.text)
                .frame(width: 250, height: 36)
                .background(.white)
                .cornerRadius(30)
                .overlay(
                    RoundedRectangle(cornerRadius: 30)
                        .inset(by: 0.5)
                        .stroke(Color(hex: S.Color.lightGray), lineWidth: 1)
                )

            Spacer()

            Button(action: {
                viewModel.getCrypto()
            }, label: {
                    ZStack{
                        Circle()
                            .frame(width: 36, height: 36)
                            .foregroundColor(Color(hex: S.Color.orange))
                        Image(systemName: "arrow.right")
                            .resizable()
                            .frame(width: 10, height: 10)
                            .foregroundColor(.black)
                            .cornerRadius(30)
                    }
                })
        }
        .padding(.top, 20)
        .padding(.horizontal, 45)
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(viewModel: SearchBarViewModel())
    }
}
