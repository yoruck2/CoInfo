//
//  SearchView.swift
//  CoInfo
//
//  Created by dopamint on 9/7/24.
//

import SwiftUI

struct SearchView: View {
    
    @State var text = ""
    @State var coinList: [Search.Coin] = [
        Search.Coin(id: "bitcoin",
                    name: "BitCoin",
                    symbol: "BTC",
                    thumb: "https://coin-images.coingecko.com/coins/images/1/large/bitcoin.png", large: "https://coin-images.coingecko.com/coins/images/1/large/bitcoin.png"),
        Search.Coin(id: "ethereum",
                    name: "Ethereum",
                    symbol: "ETH",
                    thumb: "https://coin-images.coingecko.com/coins/images/279/large/ethereum.png", large: "https://coin-images.coingecko.com/coins/images/279/large/ethereum.png"),
        Search.Coin(id: "ginnan-the-cat",
                    name: "Ginnan The Cat",
                    symbol: "GINNAN",
                    thumb: "https://coin-images.coingecko.com/coins/images/39466/standard/ginnan_logo_final.png?1724116323", large: "https://coin-images.coingecko.com/coins/images/39466/standard/ginnan_logo_final.png?1724116323")
    ]
    
    var searchedCoin: [Search.Coin] {
        return text.isEmpty ? coinList : coinList.filter { $0.name.lowercased().contains(text.lowercased()) || $0.name.contains(text) }
    }
    var body: some View {
        NavigationView {
            ScrollView {
                Spacer()
                    .navigationBarWithProfile(title: "Search")
                listView()
            }
            .searchable(text: $text)
        }
    }
    
    func listView() -> some View {
        LazyVStack {
            ForEach(searchedCoin, id: \.id) { item in
                NavigationLink {
                    CoinDetailView(coinData: item)
                } label: {
                    CoinRowView(coinData: item)
                }
                .buttonStyle(PlainButtonStyle())
            }
            .padding(.horizontal)
            .padding(.top)
        }
    }
}

#Preview {
    CoInfoTabView()
}
