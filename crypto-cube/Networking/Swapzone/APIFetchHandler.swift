//
//  APIFetchHandler.swift
//  crypto-cube
//
//  Created by Maciej Dubowik on 03/07/2023.
//

import Foundation
import Alamofire

class APIFetchHandler {
    static let sharedInstance = APIFetchHandler()

    func fetchAPIData(searchedResult: String, completion: @escaping ([Any]) -> Void) {
        let url = "https://api.swapzone.io/v1/exchange/currencies"
        let headers: HTTPHeaders = [
            "x-api-key": Config.swapzoneAPIKey
        ]

        AF.request(url, headers: headers).responseData { response in
            switch response.result {
            case .success(let data):
                    let parsedData = self.parseCoreCryptoDataJSON(data, searchedResult)
                    completion(parsedData)
            case .failure(let error):
                print(error.localizedDescription)
                completion([])
            }
        }
    }

    func fetchExchangeData(toTicker: String, amount: Double, completion: @escaping (Double) -> Void) {
        let url = "https://api.swapzone.io/v1/exchange/get-rate?from=btc&to=\(toTicker)&amount=\(amount)&rateType=all&availableInUSA=false&chooseRate=best&noRefundAddress=false"
        let headers: HTTPHeaders = [
            "x-api-key": Config.swapzoneAPIKey
        ]

        AF.request(url, headers: headers).responseData { response in
            switch response.result {
            case .success(let data):
                    let parsedData = self.parseExchangeDataJSON(data)
                    completion(parsedData)
            case .failure(let error):
                print(error.localizedDescription)
                completion(0.0)
            }
        }
    }

    func parseCoreCryptoDataJSON(_ data: Data,_ searchedResult: String) -> [CoreCrypto?] {
        do {
            let decodedData = try JSONDecoder().decode([CoreCryptoData].self, from: data)
            var foundCryptos: [CoreCrypto] = []

            for crypto in decodedData {
                let range = NSRange(location: 0, length: crypto.ticker.count)
                let tickerRegex = try! NSRegularExpression(pattern: "ep20$|rc20$|ep2$")
                let nameRegex = try! NSRegularExpression(pattern: "^\(searchedResult)")

                var cryptoName = crypto.name ?? ""

                if nameRegex.firstMatch(in: cryptoName , range: NSRange(cryptoName.startIndex..., in: cryptoName)) != nil && tickerRegex.firstMatch(in: crypto.ticker, options: [], range: range) == nil {
                    let name = crypto.name
                    let ticker = crypto.ticker
                    let network = crypto.network

                    foundCryptos.append(CoreCrypto(name: name!, ticker: ticker, network: network))
                }
            }
            return foundCryptos
        } catch {
            print(error)
            return []
        }
    }

    func parseExchangeDataJSON(_ data: Data) -> Double {
        do {
            let decodedData = try JSONDecoder().decode(ExchangeData.self, from: data)
            let result = decodedData.amountTo
            print(decodedData)
            return result
        } catch {
            print(error)
            return 0.0
        }
    }
}




