//
//  PhotoCacheManager.swift
//  AnimeHolic
//
//  Created by Puras Handharmahua on 18/07/21.
//

import Foundation
import SwiftUI

class PhotoCacheManager {
    // MARK: SINGLETON
    static let shared = PhotoCacheManager()
    
    // MARK: PROPERTIES
    var photoCache: NSCache<NSString, UIImage> = {
        let cache = NSCache<NSString, UIImage>()
        cache.countLimit = 200
        cache.totalCostLimit = 1024 * 1024 * 200
        return cache
    }()
    
    // MARK: INIT
    private init() {}
    
    // MARK: METHODS
    func add(key: String, value: UIImage) {
        photoCache.setObject(value, forKey: key as NSString)
    }
    
    func get(key: String) -> UIImage? {
        photoCache.object(forKey: key as NSString)
    }
}
