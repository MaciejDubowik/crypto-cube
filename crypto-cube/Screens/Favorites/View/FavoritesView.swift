//
//  FavoritesView.swift
//  crypto-cube
//
//  Created by Maciej Dubowik on 07/08/2023.
//

import SwiftUI

struct FavoritesView: View {
    @ObservedObject var searchBarViewModel = SearchBarViewModel()

    var body: some View {
        NavigationView {
            ZStack {
                Color(hex: "EAEAEA")

                VStack {
                    VStack {
                        Text("Favorites")
                            .foregroundColor(.black)
                            .font(Font.custom(S.Font.Lato.bold, size: 34))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 30)
                            .padding(.top, 70)
                        Text("Your saved cryptocurrencies")
                            .foregroundColor(Color(hex: S.Color.lightGray))
                            .font(Font.custom(S.Font.Lato.semiBold, size: 18))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 30)

                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 170)
                    .background(.white)
                    .roundedCorner(25, corners: [.bottomLeft, .bottomRight])

                    Spacer()

                    CryptoList(list: searchBarViewModel.searchResults)
                }

            }.ignoresSafeArea()
        }.navigationBarBackButtonHidden(true)
    }
}


struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
