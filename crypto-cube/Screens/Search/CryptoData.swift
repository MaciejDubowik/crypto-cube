//
//  CryptoData.swift
//  crypto-cube
//
//  Created by Maciej Dubowik on 30/06/2023.
//

import Foundation

struct CryptoData: Identifiable {
    let id = UUID()
    var name: String
    var shortName: String
    var price: Double
}
