//
//  ExchangeViewModel.swift
//  crypto-cube
//
//  Created by Maciej Dubowik on 14/07/2023.
//

import Foundation
import Combine

enum Status: String {
    case NOT_STARTED = "Calculate"
    case FETCHING = "Wait"
    case COMPLETED = "Done"
    case ERROR = "Can not calculate this cryptocurrency"
}

class ExchangeViewModel: ObservableObject {
    let name: String
    let ticker: String

    init(name: String, ticker: String) {
        self.name = name
        self.ticker = ticker
    }

    @Published var textBTC = ""
    @Published var textResult = ""
    @Published var status = Status.NOT_STARTED


    func getRate() {
        status = Status.FETCHING
        APIFetchHandler.sharedInstance.fetchExchangeData(toTicker: ticker, amount: Double(textBTC)!, completion: { result in
            self.textResult = "\(result)"
            print(self.textResult)
            self.status = Status.COMPLETED
        })
    }
    
}


