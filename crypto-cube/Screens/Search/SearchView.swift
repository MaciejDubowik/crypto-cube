//
//  SearchView.swift
//  crypto-cube
//
//  Created by Maciej Dubowik on 29/06/2023.
//

import SwiftUI

struct SearchView: View {
    @State var text = ""
    let values: [CryptoData] = [
        CryptoData(name: "Bitcoin", shortName: "BTC", price: 32000.38),
        CryptoData(name: "Ethereum", shortName: "ETH", price: 1200.21),
        CryptoData(name: "Dogecoin", shortName: "DOGE", price: 0.06)
    ]

    var body: some View {
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

                        HStack {
                            TextField("", text: $text)
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
                                print("search")
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

                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 235)
                    .background(.white)
                    .roundedCorner(25, corners: [.bottomLeft, .bottomRight])

                Spacer()

                VStack {
                    Text("Results")
                        .foregroundColor(.black)
                        .font(Font.custom(S.Font.Lato.bold, size: 22))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 30)
                        .padding(.top, 30)

                    Spacer()

                    List {
                        ForEach(values){ item in
                            Text("\(item.name) | \(item.shortName) |  $\(item.price, specifier: "%.2f")")
                        }
                    }
                    .padding(.top, 10)

                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.white)
                    .roundedCorner(25, corners: [.topLeft, .topRight])
                    .padding(.top, 20)
            }

        }.ignoresSafeArea()
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
