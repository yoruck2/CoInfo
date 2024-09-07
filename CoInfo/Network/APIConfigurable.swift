//
//  APIConfigurable.swift
//  CoInfo
//
//  Created by dopamint on 9/8/24.
//

import Foundation

protocol APIConfigurable {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var parameters: [URLQueryItem]? { get }
    var method: String { get }
    var headers: [String: String]? { get }
}

extension APIConfigurable {
    var url: URL? {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path
        components.queryItems = parameters
        return components.url
    }
}
