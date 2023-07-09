//
//  ExchangeView.swift
//  crypto-cube
//
//  Created by Maciej Dubowik on 06/07/2023.
//

import SwiftUI

struct ExchangeView: View {

    let name: String
    let ticker: String

    @State var textBTC = ""
    @State var textOther = ""

    var body: some View {
        ZStack{

            VStack {
                VStack {
                    Text(name)
                        .foregroundColor(.black)
                        .font(Font.custom(S.Font.Lato.bold, size: 40))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(ticker)
                        .foregroundColor(.black)
                        .font(Font.custom(S.Font.Lato.semiBold, size: 16))
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.leading, 30)
                .padding(.top, 10)


                DefaultTextField(placeholder: "from BTC", text: $textBTC)
                DefaultTextField(placeholder: "to \(ticker)", text: $textOther)

                Spacer()

                Button(action: {
                    print("calculate")
                    APIFetchHandler.sharedInstance.fetchExchangeData()
                }, label: {
                    Text("Calculate")
                        .font(Font.custom(S.Font.Lato.semiBold, size: 19))
                        .foregroundColor(.black)
                        .frame(width: 342, height: 51)
                        .background(Color(hex: S.Color.orange))
                        .cornerRadius(10)
                }).padding(.bottom, 80)





            }
        }
    }
}

struct ExchangeView_Previews: PreviewProvider {
    static var previews: some View {
        ExchangeView(name: "", ticker: "")
    }
}
