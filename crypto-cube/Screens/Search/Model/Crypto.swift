//
//  CryptoData.swift
//  crypto-cube
//
//  Created by Maciej Dubowik on 30/06/2023.
//

import Foundation

struct CoreCrypto: Identifiable {
    let id = UUID()
    var name: String
    var ticker: String
    var network: String
}
