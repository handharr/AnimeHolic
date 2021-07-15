//
//  VideoModel.swift
//  AnimeHolic
//
//  Created by Puras Handharmahua on 09/07/21.
//

import Foundation

struct APIResponse: Codable {
    let top: [VideosModel]
}

enum TopVideosType: String, Codable {
    case airing
    case upcoming
    case movie
    case ova
}

struct VideosModel: Codable, Identifiable {
    let id: Int
    let rank: Int?
    let title: String?
    let url: String?
    let imageUrl: String?
    let type: String?
    let episodes: Int?
//    let startDate: String?
    let score: Float?
    
    enum CodingKeys: String, CodingKey {
        case id = "mal_id"
        case imageUrl = "image_url"
//        case startDate = "start_date"
        case rank, title, url, type, episodes, score
    }
    
    static let dummyData = [
        VideosModel(id: 0, rank: 1, title: "Anime Title", url: nil, imageUrl: nil, type: nil, episodes: 20,score: 8.6),
        VideosModel(id: 9999, rank: 2, title: "Some Title", url: nil, imageUrl: nil, type: nil, episodes: 15, score: 4.5),
        VideosModel(id: 9998, rank: 3, title: "Another Title", url: nil, imageUrl: nil, type: nil, episodes: 50, score: 9),
    ]
}
