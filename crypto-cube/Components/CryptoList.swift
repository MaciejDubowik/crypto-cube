//
//  CryptoList.swift
//  crypto-cube
//
//  Created by Maciej Dubowik on 11/07/2023.
//

import SwiftUI

struct CryptoList: View {
    var list: [CoreCrypto]

    var body: some View {
        VStack {
            Text("Results")
                .foregroundColor(.black)
                .font(Font.custom(S.Font.Lato.bold, size: 22))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 30)
                .padding(.top, 30)

            Spacer()

            List {
                ForEach(list) { item in
                    NavigationLink(destination: ExchangeView(name: item.name, ticker: item.ticker), label: {
                        Text("\(item.name) | \(item.ticker) |  \(item.network)")
                    })

                }

            }
            .padding(.top, 10)

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.white)
        .roundedCorner(25, corners: [.topLeft, .topRight])
        .padding(.top, 20)
    }
}

struct CryptoList_Previews: PreviewProvider {
    static var previews: some View {
        CryptoList(list: [CoreCrypto(name: "BitTorrent-New", ticker: "btt", network: "TRX"), CoreCrypto(name: "Bitcoin Diamond", ticker: "bcd", network: "BCD")])
    }
}
