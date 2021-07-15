//
//  VideoCardPrimary.swift
//  AnimeHolic
//
//  Created by Puras Handharmahua on 12/07/21.
//

import SwiftUI
import AVKit

struct VideoCardPrimary: View {
    
    let url = URL(string: "https://www.youtube.com/embed/YOn779f6lwI?enablejsapi=1&wmode=opaque&autoplay=1")!
    let avPlayer = AVPlayer(url: URL(string: "https://www.youtube.com/watch?v=QmRJzGUTFf4")!)
    
    @State private var isTrailer = false
    @State private var isPlaying = false
    
    var body: some View {
        GeometryReader { proxy in
            if isChange(proxy) {
                VideoPlayer(player: avPlayer)
                    .scaledToFill()
                    .frame(width: proxy.size.width)
            } else {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.blue)
            }
        }
    }
}

// MARK: - FUNCTIONS
extension VideoCardPrimary {
    private func isChange(_ proxy: GeometryProxy) -> Bool {
        let val = proxy.frame(in: .global).minX
        
        if val > 0 && val < 100 {
            return true
        }
        return false
    }
}

struct VideoCardPrimary_Previews: PreviewProvider {
    static var previews: some View {
        VideoCardPrimary()
    }
}
