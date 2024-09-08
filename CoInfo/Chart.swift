//
//  Chart.swift
//  CoInfo
//
//  Created by dopamint on 9/8/24.
//

import SwiftUI
import Charts

struct PricePoint: Identifiable {
    let id = UUID()
    let index: Int
    let price: Double
}

struct AreaPriceChartView: View {
    let data: [PricePoint]
    
    init(prices: [Double]) {
        self.data = prices.enumerated().map { PricePoint(index: $0, price: $1) }
    }
    
    var body: some View {
        Chart(data) { point in
            AreaMark(
                x: .value("Time", point.index),
                y: .value("Price", point.price)
            )
            .foregroundStyle(
                LinearGradient(
                    gradient: Gradient(colors: [Color.purple.opacity(0.5), Color.purple.opacity(0.1)]),
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            
            LineMark(
                x: .value("Time", point.index),
                y: .value("Price", point.price)
            )
            .foregroundStyle(Color.purple)
        }
        .chartXAxis(.hidden)
        .chartYAxis(.hidden)
        .chartYScale(domain: .automatic(includesZero: false))
        .frame(height: 400)
    }
}

struct ContentView: View {
    let prices: [Double] = []
    
    var body: some View {
        VStack {
            AreaPriceChartView(prices: prices)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
