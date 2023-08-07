//
//  ExchangeView.swift
//  crypto-cube
//
//  Created by Maciej Dubowik on 06/07/2023.
//

import SwiftUI

struct ExchangeView: View {
    @ObservedObject var exchangeViewModel: ExchangeViewModel
    @FocusState private var keyboardFocused: Bool

    var body: some View {
        ZStack{

            VStack {
                VStack {
                    Text(exchangeViewModel.name)
                        .foregroundColor(.black)
                        .font(Font.custom(S.Font.Lato.bold, size: 40))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(exchangeViewModel.ticker)
                        .foregroundColor(.black)
                        .font(Font.custom(S.Font.Lato.semiBold, size: 16))
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.leading, 30)
                .padding(.top, 10)
                .padding(.bottom, 50)


                DefaultTextField(placeholder: "from BTC", text: $exchangeViewModel.textBTC)
                    .keyboardType(.decimalPad)
                    .focused($keyboardFocused)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            keyboardFocused = true
                        }}
                    
                DefaultTextField(placeholder: "to \(exchangeViewModel.ticker)", text: $exchangeViewModel.textResult)

                Spacer()

                Button(action: {
                    print("calculate")
                    print(exchangeViewModel.name)
                    print(exchangeViewModel.ticker)
                    print(exchangeViewModel.textResult)
                    exchangeViewModel.getRate()
                }, label: {
                    Text(exchangeViewModel.status.rawValue)
                        .font(Font.custom(S.Font.Lato.semiBold, size: 19))
                        .foregroundColor(.black)
                        .frame(width: 342, height: 51)
                        .background(exchangeViewModel.status == .FETCHING ? Color(hex: S.Color.lightGray) : Color(hex: S.Color.orange))
                        .cornerRadius(10)
                }).padding(.bottom, 80)





            }
        }
    }
}

struct ExchangeView_Previews: PreviewProvider {
    static var previews: some View {
        var viewModel = ExchangeViewModel(name: "Name", ticker: "Ticker")
        ExchangeView(exchangeViewModel: viewModel)
    }
}
