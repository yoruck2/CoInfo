//
//  CoinDetailView.swift
//  CoInfo
//
//  Created by dopamint on 9/8/24.
//

import SwiftUI

enum PriceType: String {
    case ath
    case atl
    case low_24h
    case high_24h
}
struct CoinDetailView: View {
    
    let coinData: Search.Coin
    @State var marketData: Markets?
    @State var random: Int = 10
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                // 보일러
                AsyncImage(url: URL(string: coinData.large)) { phase in
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
                            .frame(width: 40, height: 40)
                    @unknown default:
                        EmptyView()
                    }
                }
                Text(marketData?.first?.name ?? "")
                    .font(.largeTitle).bold()
            }
            
            Text("\(marketData?.first?.current_price?.formatToKRW() ?? "")")
                .font(.largeTitle).bold()
            Text(marketData?.first?.price_change_percentage_24h?.formatToPercent() ?? "")
            VStack(alignment: .leading) {
                HStack {
                    makePriceView(.high_24h)
                    Spacer()
                    makePriceView(.low_24h)
                }
                HStack {
                    makePriceView(.ath)
                    Spacer()
                    makePriceView(.atl)
                }
            }
        }
        
        .toolbar {
            Button {
                print("tab")
            } label: {
                Image(systemName: "star")
                    .font(.system(size: 25))
            }
        }
        .onAppear() {
            fetchMarket()
            
        }
        AreaPriceChartView(prices: marketData?.first?.sparkline_in_7d?.price ?? [])
    }
    
    func makePriceView(_ name: PriceType) -> some View {
        switch name {
        case .ath:
            return VStack {
                Text(name.rawValue)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Text(marketData?.first?.ath?.formatToKRW() ?? "")
            }
        case .atl:
            return VStack {
                Text(name.rawValue)
                Text(marketData?.first?.atl?.formatToKRW() ?? "")
            }
        case .low_24h:
            return VStack {
                Text(name.rawValue)
                Text(marketData?.first?.low_24h?.formatToKRW() ?? "")
            }
        case .high_24h:
            return VStack {
                Text(name.rawValue)
                Text(marketData?.first?.high_24h?.formatToKRW() ?? "")
            }
        }
    }
    
    func fetchMarket() {
        Task {
            do {
                marketData = try await NetworkManager.shared.callRequest(endPoint: .market(currency: "krw",
                                                                                           ids: coinData.id,
                                                                                           sparkline: true),
                                                                         model: Markets.self)
                print(marketData)
            } catch {
                print(error)
            }
        }
    }
}

#Preview {
    CoInfoTabView()
}
