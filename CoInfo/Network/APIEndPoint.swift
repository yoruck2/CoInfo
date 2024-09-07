//
//  APIEndPoint.swift
//  CoInfo
//
//  Created by dopamint on 9/8/24.
//

import Foundation

enum APIEndPoint: APIConfigurable {
    
    case trending
    case search(query: String)
    case market(currency: String?, ids: String?, sparkline: Bool?)
    
    var method: String { "GET" }
    var headers: [String: String]? { ["Content-Type": "application/json"] }
    
    var scheme: String {
        return "https"
    }
    var host: String {
        return "api.coingecko.com"
    }
    var path: String {
        switch self {
        case .trending:
            return "/api/v3/search/trending"
        case .search(_):
            return "/api/v3/search"
         case .market(_,_,_):
             return "/api/v3/coins/markets"
         }
    }
    
    var parameters: [URLQueryItem]?  {
        switch self {
        case .trending:
            return nil
        case .search(query: let query):
            return [URLQueryItem(name: "query", value: query)]
        case .market(currency: let currency, ids: let ids, sparkline: let sparkline):
            return [URLQueryItem(name: "vs_currency", value: currency),
                    URLQueryItem(name: "ids", value: ids),
                    URLQueryItem(name: "sparkline", value: "\(String(describing: sparkline))")]
        }
    }
}
