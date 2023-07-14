//
//  ExchangeViewModel.swift
//  crypto-cube
//
//  Created by Maciej Dubowik on 14/07/2023.
//

import Foundation
import Combine

class ExchangeViewModel: ObservableObject {
    let name: String
    let ticker: String

    init(name: String, ticker: String) {
        self.name = name
        self.ticker = ticker
    }

    @Published var textBTC = "0.00"
    @Published var textResult = "0.00"


    func getRate() {
        APIFetchHandler.sharedInstance.fetchExchangeData(toTicker: ticker, amount: Double(textBTC)!, completion: { result in
            self.textResult = "\(result)"
            print(self.textResult)
        })
    }
    
}


