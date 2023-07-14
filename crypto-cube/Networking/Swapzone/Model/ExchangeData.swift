//
//  ExchangeData.swift
//  crypto-cube
//
//  Created by Maciej Dubowik on 09/07/2023.
//

import Foundation

struct ExchangeData: Codable {
    let from: String
    let fromNetwork: String
    let to: String
    let toNetwork: String
    let amountFrom: Double
    let amountTo: Double
    let quotaId: String
    let minAmount: Double?
    let maxAmount: Double?
}
