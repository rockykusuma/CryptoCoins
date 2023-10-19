//
//  CoinsDetailScreen.swift
//  SampleOne
//
//  Created by Rakesh Kusuma on 12/10/23.
//

import SwiftUI

struct CoinsDetailView: View {
    var selectedCoin: Coin
    
    var body: some View {
        ZStack {
            Color.gray
            VStack(alignment: .leading) {
                Text("Coin Name: \(selectedCoin.name)")
                Text("Coin Price: \(selectedCoin.currentPrice)")
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    CoinsDetailView(selectedCoin: Coin.mock())
}
