//
//  CoinSearch.swift
//  CoInfo
//
//  Created by dopamint on 9/7/24.
//

import SwiftUI

struct CoinSearch: View {
    
    var body: some View {
        Text("Hello, World!")
        Text("\(APIEndPoint.trending.url)")
            .task {
                print("ss")
                await fetchTrending()
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

#Preview {
    CoinSearch()
}
