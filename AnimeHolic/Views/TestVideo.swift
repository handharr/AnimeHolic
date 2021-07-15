//
//  TestVideo.swift
//  AnimeHolic
//
//  Created by Puras Handharmahua on 12/07/21.
//

import SwiftUI
import AVKit

struct TestVideo: View {
    
    let avPlayer = AVPlayer(url: URL(string: "https://www.youtube.com/watch?v=QmRJzGUTFf4")!)
    
    var body: some View {
        VStack {
            VideoPlayer(player: avPlayer)
                .scaledToFit()
                .frame(maxWidth: .infinity)
        }
    }
}

struct TestVideo_Previews: PreviewProvider {
    static var previews: some View {
        TestVideo()
    }
}
