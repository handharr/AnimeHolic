//
//  VideosService.swift
//  AnimeHolic
//
//  Created by Puras Handharmahua on 15/07/21.
//

import Foundation
import Combine

class VideosService {
    
    static let shared = VideosService()
    
    private init() {}
    
    /// Create a request to server for Videos
    /// - Parameter endpoint: Videos API
    /// - Returns: A publisher of Just that returns a Codable Type
    func request<T: Codable>(from endpoint: VideosApi) -> AnyPublisher<T, APIError> {
        URLSession
            .shared
            .dataTaskPublisher(for: endpoint.urlRequest)
            .receive(on: DispatchQueue.main)
            .mapError { _ in APIError.unknown }
            .flatMap { data, response -> AnyPublisher<T, APIError> in
                
                guard let response = response as? HTTPURLResponse else {
                    return Fail(error: APIError.unknown).eraseToAnyPublisher()
                }
                
                if (200...299).contains(response.statusCode) {
                    let decoder = JSONDecoder()
                    
                    return Just(data)
                        .decode(type: T.self, decoder: decoder)
                        .mapError { _ in APIError.decodingError }
                        .eraseToAnyPublisher()
                    
                } else {
                    return Fail(error: APIError.errorCode(response.statusCode)).eraseToAnyPublisher()
                }
            }
            .eraseToAnyPublisher()
    }
}
