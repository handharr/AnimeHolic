//
//  APIError.swift
//  AnimeHolic
//
//  Created by Puras Handharmahua on 15/07/21.
//

import Foundation

enum APIError: Error {
    case decodingError
    case errorCode(Int)
    case unknown
}

extension APIError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .decodingError:
            return "Failed to decode object from the service"
        case .errorCode(let code):
            return "Error code - \(code). Something went wrong"
        case .unknown:
            return "Ups, something went wrong"
        }
    }
}
