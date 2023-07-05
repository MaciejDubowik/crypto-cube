//
//  CoreCrpytoData.swift
//  crypto-cube
//
//  Created by Maciej Dubowik on 05/07/2023.
//

import Foundation

struct CoreCryptoData: Codable {
    let name: String?
    let ticker: String
    let network: String
    let smartContract: String?
    let alias: [String]
}
