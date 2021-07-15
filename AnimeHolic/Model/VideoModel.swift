//
//  VideoModel.swift
//  AnimeHolic
//
//  Created by Puras Handharmahua on 09/07/21.
//

import Foundation

struct APIResponse: Codable {
    let data: [VideoModel]
}

struct VideoModel: Codable, Identifiable {
    let id: Int?
    let rank: Int?
    let title: String?
    let url: String?
    let imageUrl: String?
    let type: String?
    let episodes: Int?
    let startDate: String?
    let score: Float?
    
    enum CodingKeys: String, CodingKey {
        case id = "malId"
        case rank, title, url, imageUrl, type, episodes, startDate, score
    }
}

