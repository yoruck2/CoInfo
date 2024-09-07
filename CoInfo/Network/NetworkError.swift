//
//  NetworkError.swift
//  CoInfo
//
//  Created by dopamint on 9/8/24.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case decodingError(Error)
    case serverError(Int)
    case unknownError(Error)
}

extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "비정상 URL"
        case .invalidResponse:
            return "응답 오류"
        case .decodingError(let error):
            return "디코딩 에러: \(error.localizedDescription)"
        case .serverError(let statusCode):
            return "서버에서 에러를 보냄: \(statusCode)"
        case .unknownError(let error):
            return "알수없는 오류: \(error.localizedDescription)"
        }
    }
}
