//
//  TrendingView.swift
//  CoInfo
//
//  Created by dopamint on 9/7/24.
//

import SwiftUI

struct TrendingView: View {
    
//    @State var trendingData: Trending = [
//        Trending(coins: [Coin(item: Item(], nfts: T##[NFT]?)
//    
//    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                FavoriteCellView()
                Text("My Favorite")
                    .navigationBarWithProfile(title: "Crypto Coin")
            }
            
        }
    }
    
    func fetchTrending() async {
        Task {
            do {
                let trending = try await NetworkManager.shared.callRequest(endPoint: .search(query: "bitcoin"),
                                                                                     model: Search.self)
                print(trending)
            } catch {
                print(error)
            }
        }
    }
}

struct FavoriteCellView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(.gray)
                .clipShape(RoundedRectangle(cornerRadius: 25))
                .frame(width: 200, height: 180)
                .padding()
            
            VStack(alignment: .leading) {
                HStack {
                    VStack {
                        
                    }
                }
                Spacer()
                Text("나의 소비내역")
                    .font(.callout).bold()
                Text("sdf")
                    .font(.title).bold()
            }
            .foregroundStyle(.white)
            .padding(40)
        }
    }
}

#Preview {
    TrendingView()
}
