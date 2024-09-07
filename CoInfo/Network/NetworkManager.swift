//
//  NetworkManager.swift
//  CoInfo
//
//  Created by dopamint on 9/7/24.
//

import Foundation

final class NetworkManager {
    
    static let shared = NetworkManager()
    private init() {}
    
    func callRequest<T: Decodable>(endPoint: APIEndPoint, model: T.Type) async throws -> T {
       
        guard let url = endPoint.url else {
            throw NetworkError.invalidURL
        }
        print(url)
        
        let request = URLRequest(url: url)
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.invalidResponse
            }
            switch httpResponse.statusCode {
            case 200...299:
                print("200")
                return try JSONDecoder.decode(data, model: T.self)
            default:
                throw NetworkError.serverError(httpResponse.statusCode)
            }
        } catch {
            throw NetworkError.unknownError(error)
        }
    }
}


