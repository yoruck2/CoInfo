//
//  Search.swift
//  CoInfo
//
//  Created by dopamint on 9/7/24.
//

struct Search: Decodable {
    let coins: [Coin]
    
    struct Coin: Decodable {
        let id: String
        let name: String
        let symbol: String
        let thumb: String
    }
}
