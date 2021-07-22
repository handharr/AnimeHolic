//
//  VideosViewModel.swift
//  AnimeHolic
//
//  Created by Puras Handharmahua on 09/07/21.
//

import Foundation
import Combine

class VideosViewModel: ObservableObject {
    
    // MARK: PROPERTIES
    private let service = VideosService.shared
    private var cancellable = Set<AnyCancellable>()
    var videos = [VideosModel]()
    
    @Published private(set) var state: ResultState = .loading
    
    // MARK: INIT
    init(withType type: VideosApi) {
        getVideos(withType: type)
    }
    
    // MARK: FUNCTIONS
    
    /// Download, fetch, and decode Top Videos from Service
    ///
    /// This function will fetch the URL and subscribe to VideoService publisher
    /// by the video category type
    ///
    /// - Parameter vidsType: VideosApi enum
    func getVideos(withType vidsType: VideosApi) {
        self.state = .loading
        
        service
            .request(from: vidsType)
            .sink { [weak self] completion in
                
                switch completion {
                case .finished:
                    self?.state = .success
                case .failure(let err):
                    self?.state = .failed(err: err)
                }
                
            } receiveValue: { [weak self] (data: APIResponse) in
                self?.videos = data.top
            }
            .store(in: &cancellable)
    }
    
    /// Get the first five of Videos array
    /// - Returns: an array of VideosModel
    func getFirstFive() -> [VideosModel] {
        let firstFive = videos.prefix(5)
        
        return Array(firstFive)
    }
}

