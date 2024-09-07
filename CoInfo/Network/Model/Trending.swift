//
//  Trending.swift
//  CoInfo
//
//  Created by dopamint on 9/7/24.
//

struct Trending: Decodable {
    let coins: [Coin]?
    let nfts: [NFT]?
}

struct Coin: Decodable {
    let item: Item?
    
    struct Item: Decodable {
        let id: String
        let name:  String
        let symbol: String
        let small: String
        let data: CoinData
        
    }
    
    struct CoinData: Decodable {
        let price: Double
        let price_change_percentage_24h: PriceChanges
    }
    
    struct PriceChanges: Decodable {
        let krw: Double
    }
}

struct NFT: Decodable {
    let name: String?
    let symbol: String?
    let thumb: String?
    let data: NFTData?
    
    struct NFTData: Decodable {
        let floor_price: String?
        let floor_price_in_usd_24h_percentage_change: String?
    }
}
