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
    private let service: VideosService
    private var cancellable = Set<AnyCancellable>()
    var videos = [VideosModel]()
    
    @Published private(set) var state: ResultState = .loading
    
    // MARK: INIT
    init(service: VideosService) {
        self.service = service
    }
    
    // MARK: FUNCTIONS
    
    /// Download, fetch, and decode Top Videos from Service
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
    
    func getFirstFive() -> [VideosModel] {
        let firstFive = videos.prefix(5)
        
        return Array(firstFive)
    }
}

