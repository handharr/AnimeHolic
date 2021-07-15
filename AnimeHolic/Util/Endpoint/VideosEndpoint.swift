//
//  VideosEndpoint.swift
//  AnimeHolic
//
//  Created by Puras Handharmahua on 15/07/21.
//

import Foundation

enum VideosApi {
    case getTop
    case getAnime(Int)
}

// MARK: - Functions

extension VideosApi {
    var baseUrl: URL {
        switch self {
        case .getTop, .getAnime:
            return URL(string: "https://api.jikan.moe/v3/")!
        }
    }
    
    var path: String {
        switch self {
        case .getTop:
            return "top/anime/1/airing"
        case .getAnime(let id):
            return "anime/\(id)"
        }
    }
    
    var urlRequest: URLRequest {
        return URLRequest(url: self.baseUrl.appendingPathComponent(self.path))
    }
}
