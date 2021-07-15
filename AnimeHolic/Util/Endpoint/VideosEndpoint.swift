//
//  VideosEndpoint.swift
//  AnimeHolic
//
//  Created by Puras Handharmahua on 15/07/21.
//

import Foundation

enum VideosApi {
    case getTopAiring
    case getAnime(Int)
    case getTopUpcoming
    case getTopMovie
    case getTopOva
}

// MARK: - Functions

extension VideosApi {
    var baseUrl: URL {
        return URL(string: "https://api.jikan.moe/v3/")!
    }
    
    var path: String {
        switch self {
        case .getTopAiring:
            return "top/anime/1/airing"
        case .getAnime(let id):
            return "anime/\(id)"
        case .getTopUpcoming:
            return "top/anime/1/upcoming"
        case .getTopMovie:
            return "top/anime/1/movie"
        case .getTopOva:
            return "top/anime/1/ova"
        }
    }
    
    var urlRequest: URLRequest {
        return URLRequest(url: self.baseUrl.appendingPathComponent(self.path))
    }
    
    var type: TopVideosType? {
        switch self {
        case .getTopAiring:
            return .airing
        case .getTopUpcoming:
            return .upcoming
        case .getTopOva:
            return .ova
        case .getTopMovie:
            return .movie
        case .getAnime(_):
            return nil
        }
    }
}
