//
//  ResultState.swift
//  AnimeHolic
//
//  Created by Puras Handharmahua on 15/07/21.
//

import Foundation

enum ResultState {
    case loading
    case success
    case failed(err: Error)
}
