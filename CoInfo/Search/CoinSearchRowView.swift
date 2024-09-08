//
//  CoinSearchRowView.swift
//  CoInfo
//
//  Created by dopamint on 9/8/24.
//

import SwiftUI

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
                        .frame(width: 40, height: 40)
                @unknown default:
                    EmptyView()
                }
            }
            .frame(width: 40, height: 40)
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 5))
            
            VStack(alignment: .leading) {
                Text(coinData.name)
                    .fontWeight(.bold)
                Text(coinData.symbol)
                    .font(.system(size: 15))
            }
            Spacer()
        }
        .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 10))
        .contentShape(Rectangle())
        Button {
            print("tap")
        } label: {
            Image(systemName: "star")
        }
    }
}
