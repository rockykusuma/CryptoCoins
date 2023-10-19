//
//  Endpoint.swift
//  SampleOne
//
//  Created by Rakesh Kusuma on 12/10/23.
//

import Foundation

enum Endpoint {
    case getCoins
}

extension Endpoint {
    var requestURL: URL? {
        switch self {
        case .getCoins:
            return URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false&locale=en")       
        }
    }
}
