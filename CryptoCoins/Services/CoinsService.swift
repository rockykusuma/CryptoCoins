//
//  APIService.swift
//  SampleOne
//
//  Created by Rakesh Kusuma on 12/10/23.
//

import Foundation

protocol CoinsService {
    func fetchCoins() async throws -> [Coin]?
}

