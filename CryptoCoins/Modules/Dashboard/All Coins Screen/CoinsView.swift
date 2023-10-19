//
//  ContentView.swift
//  SampleOne
//
//  Created by Rakesh Kusuma on 12/10/23.
//

import SwiftUI

struct CoinsView: View {
    
    @State var viewModel: CoinsViewModel
    
    var body: some View {
        NavigationStack {
            if viewModel.isLoading {
                ProgressView()
            } else {
                listView
                    .navigationTitle("Crypto Coins")
            }
        }
        .task {
            await viewModel.fetchCoins()
        }
    }
    
    var listView: some View {
        List(viewModel.coins, id: \.id) { coin in
            NavigationLink(value: coin) {
                coinRow(coin)
            }
        }
        .listStyle(.grouped)
        .navigationDestination(for: Coin.self) { value in
            CoinsDetailView(selectedCoin: value)
        }
    }
}

extension CoinsView {
    
    private func coinRow(_ coin: Coin) -> some View {
        HStack {
            Text(coin.marketCapRank.description)
                .foregroundStyle(Color.secondary)
            AsyncImage(url: URL(string: coin.image)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
            }
            .frame(width: 50, height: 50)
            .clipShape(.circle)
            VStack(alignment: .leading) {
                Text(coin.name)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Text(coin.symbol)
                    .font(.footnote)
            }
        }
    }
}

#Preview {
    CoinsView(viewModel: CoinsViewModel())
}
