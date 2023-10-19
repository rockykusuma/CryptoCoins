//
//  Coin.swift
//  SampleOne
//
//  Created by Rakesh Kusuma on 12/10/23.
//

import Foundation

struct Coin: Identifiable, Hashable {
    let id, symbol, name, image: String
    let currentPrice: Double
    let marketCapRank: Int
}

extension Coin: Codable {
}

extension Coin: Mockable {
    static func mock() -> Coin {
        return Coin(id: UUID().uuidString, symbol: "testSymbol", name: "testName", image: "", currentPrice: 30, marketCapRank: 2)
    }
}
