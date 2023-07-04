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
    func fetchAPIData() {
        let url = "https://api.swapzone.io/v1/exchange/currencies";
        let headers: HTTPHeaders = [
            "x-api-key": Config.swapzoneAPIKey
        ]
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: headers, interceptor: nil)


        AF.request(url, headers: headers).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let jsonData = try JSONDecoder().decode([Model].self, from: data)
                    print(jsonData)
                    let name = jsonData[0].name
                    print(name)

                } catch {
                    print(error)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }

    }
}

struct Model: Codable {
    let name: String?
    let ticker: String
    let network: String
    let smartContract: String?
    let alias: [String]
}


