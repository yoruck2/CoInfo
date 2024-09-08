//
//  SearchView.swift
//  CoInfo
//
//  Created by dopamint on 9/7/24.
//

import SwiftUI



struct ContentView: View {
    
    @State var text = ""
    @State var coinList: [Search.Coin] = [
        Search.Coin(id: "BitCoin",
                    name: "BitCoin",
                    symbol: "BTC",
                    thumb: "https://coin-images.coingecko.com/coins/images/1/large/bitcoin.png"),
        Search.Coin(id: "ethereum",
                    name: "Ethereum",
                    symbol: "ETH",
                    thumb: "https://coin-images.coingecko.com/coins/images/279/large/ethereum.png"),
        Search.Coin(id: "ginnan-the-cat",
                    name: "Ginnan The Cat",
                    symbol: "GINNAN",
                    thumb: "https://coin-images.coingecko.com/coins/images/39466/standard/ginnan_logo_final.png?1724116323"),
        
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
                    CoinDetailView()
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

struct CoinRowView: View {
    
    let coinData: Search.Coin
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: coinData.thumb)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                case .failure:
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                @unknown default:
                    EmptyView()
                }
            }
            VStack(alignment: .leading) {
                Text(coinData.name)
                    .fontWeight(.bold)
                Text(coinData.symbol)
                    .font(.system(size: 15))
            }
            Spacer()
            Button {
                print("tap")
            } label: {
                Image(systemName: "star")
            }
        }.padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 10))
    }
}
#Preview {
    ContentView()
}
