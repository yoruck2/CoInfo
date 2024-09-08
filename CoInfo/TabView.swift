//
//  TabView.swift
//  CoInfo
//
//  Created by dopamint on 9/8/24.
//

import SwiftUI

struct CoInfoTabView: View {
    
    var body: some View {
        TabView {
            TrendingView()
                .tabItem {
                    Image(systemName: "chart.line.uptrend.xyaxis")
                }
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
            FavoriteCoinView()
                .tabItem {
                    Image(systemName: "star")
                }
            FavoriteCoinView()
                .tabItem {
                    Image(systemName: "person")
                }
        }
        .accentColor(.purple)
    }
    
}

#Preview {
    CoInfoTabView()
}
