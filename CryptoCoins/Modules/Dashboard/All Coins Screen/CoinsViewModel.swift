//
//  CoinsViewModel.swift
//  SampleOne
//
//  Created by Rakesh Kusuma on 12/10/23.
//

import Foundation
import Observation

@Observable
class CoinsViewModel {
    var coins: [Coin] = []
    var isLoading: Bool = false
    
    let coinService: CoinsService
    
    init(coinService: CoinsService = CoinsServiceImpl()) {
        self.coinService = coinService
    }
    
    func fetchCoins() async {
        await updateLoading(status: true)
        do {
            let result = try await coinService.fetchCoins()
            await updateCoins(coins: result ?? [] )
        } catch {
            print("Error Message: \(error.localizedDescription)")
        }
        await updateLoading(status: false)
    }
    
    
    func updateCoins(coins: [Coin]) async {
        await MainActor.run {
            self.coins = coins
        }
    }
    
    func updateLoading(status: Bool) async {
        await MainActor.run {
            self.isLoading = status
        }
    }
}
