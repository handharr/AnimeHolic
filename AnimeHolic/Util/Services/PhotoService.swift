//
//  PhotoService.swift
//  AnimeHolic
//
//  Created by Puras Handharmahua on 18/07/21.
//

import Foundation
import Combine
import SwiftUI

class PhotoService {
    // MARK: SINGLETON
    static let shared = PhotoService()
    
    // MARK: INIT
    private init() {}
    
    // MARK: METHODS
    
    /// Create a publisher to fetch data from server
    /// - Parameter urlString: the string of url
    /// - Returns: Any publisher with API error type
    func requestPhoto(_ urlString: String) -> AnyPublisher<UIImage?, APIError> {
        
        guard let url = URL(string: urlString) else {
            return Fail(error: APIError.unknown).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map{ UIImage(data: $0.data) }
            .receive(on: DispatchQueue.main)
            .mapError { _ in APIError.unknown }
            .eraseToAnyPublisher()
    }
}
