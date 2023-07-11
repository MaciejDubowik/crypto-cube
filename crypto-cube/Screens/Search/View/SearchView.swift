//
//  SearchView.swift
//  crypto-cube
//
//  Created by Maciej Dubowik on 29/06/2023.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var searchBarViewModel = SearchBarViewModel()

    var body: some View {
        NavigationView {
            ZStack {
                Color(hex: "EAEAEA")
                
                VStack {
                    VStack {
                        Text("Sign In")
                            .foregroundColor(.black)
                            .font(Font.custom(S.Font.Lato.bold, size: 34))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 30)
                            .padding(.top, 70)
                        Text("Sign In to your account")
                            .foregroundColor(Color(hex: S.Color.lightGray))
                            .font(Font.custom(S.Font.Lato.semiBold, size: 18))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 30)

                        SearchBarView(viewModel: searchBarViewModel)
                        
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 235)
                    .background(.white)
                    .roundedCorner(25, corners: [.bottomLeft, .bottomRight])
                    
                    Spacer()

                    CryptoList(list: searchBarViewModel.searchResults)
                }
                
            }.ignoresSafeArea()
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
