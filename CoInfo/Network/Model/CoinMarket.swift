//
//  CoinMarket.swift
//  CoInfo
//
//  Created by dopamint on 9/8/24.
//

import Foundation

typealias Markets = [CoinMarket]

struct CoinMarket: Decodable {
    let id: String?
    let name: String?
    let symbol: String? // 단위
    let image: String?
    let current_price: Int?
    let price_change_percentage_24h: Double? // 변동폭
    let low_24h: Int? // 저가
    let high_24h: Int? // 고가
    let ath: Int? // 신고점
    let ath_date: String? // 신고점 일자
    let atl: Int? // 신저점
    let atl_date: String? // 신저점 일자
    let last_updated: String? // 코인 시장 데이터 업데이트 시각
    let sparkline_in_7d: Price? // 일주일간 코인 시세
    
    struct Price: Decodable {
        let price: [Double]?
    }
}
