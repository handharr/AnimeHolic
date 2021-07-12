//
//  VideoModel.swift
//  AnimeHolic
//
//  Created by Puras Handharmahua on 09/07/21.
//

import Foundation

struct APIResponse: Codable {
    let data: [Video]
}

struct Video: Codable {
    let malId: Int
    let rank: Int
    let title: String
    let url: String
    let imageUrl: String
    let type: String
    let episodes: Int
    let startDate: String
    let score: Float
}

