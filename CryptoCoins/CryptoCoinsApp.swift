//
//  CryptoCoinsApp.swift
//  CryptoCoins
//
//  Created by Rakesh Kusuma on 19/10/23.
//

import SwiftUI

@main
struct CryptoCoinsApp: App {
    var body: some Scene {
        WindowGroup {
            CoinsView(viewModel: CoinsViewModel())
        }
    }
}
