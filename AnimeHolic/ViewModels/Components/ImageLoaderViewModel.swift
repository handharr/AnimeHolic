//
//  ImageLoaderViewModel.swift
//  AnimeHolic
//
//  Created by Puras Handharmahua on 18/07/21.
//

import Foundation
import SwiftUI
import Combine

class ImageLoaderViewModel: ObservableObject {
    
    // MARK: PROPERTIES
    let urlString: String
    let imageKey: String
    let title: String
    
    private let cacheManager = PhotoCacheManager.shared
    private var cancellabels = Set<AnyCancellable>()
    
    @Published var isLoading: Bool = false
    @Published var image: UIImage?
    
    // MARK: INIT
    init(urlString: String, key: String, title: String) {
        self.title = title
        self.urlString = urlString
        self.imageKey = "\(key)-posterImage"
        getImage()
    }
    
    // MARK: METHODS
    
    /// Get the image for ImageLoaderView
    ///
    /// If the image already cached, then use the cached image.
    /// If the image not cached yet, then download the image.
    /// 
    ///
    private func getImage() {
        if let savedImage = cacheManager.get(key: imageKey) {
            self.image = savedImage
            self.isLoading = false
        } else {
            downloadImage()
        }
    }
    
    /// Download the image from internet
    private func downloadImage() {
        isLoading = true
        
        PhotoService
            .shared
            .requestPhoto(urlString)
            .sink { [weak self] err in
                self?.isLoading = false
                print("err nihh")
            } receiveValue: { [weak self] returnedImage in
                guard
                    let self = self,
                    let image = returnedImage else {
                    return
                }
                self.image = image
                self.cacheManager.add(key: self.imageKey, value: image)
                self.isLoading = false
            }
            .store(in: &cancellabels)
    }
}
