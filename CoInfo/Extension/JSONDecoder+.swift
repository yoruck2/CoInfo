//
//  JSONDecoder+.swift
//  CoInfo
//
//  Created by dopamint on 9/8/24.
//

import Foundation

extension JSONDecoder {
    static let jsonDecoder = JSONDecoder()
     
    static func decode<T: Decodable>(_ data: Data, model: T.Type) throws -> T {
        do {
            let decodedData = try JSONDecoder.jsonDecoder.decode(model, from: data)
            return decodedData
        } catch {
            throw NetworkError.decodingError(error)
        }
    }
}
