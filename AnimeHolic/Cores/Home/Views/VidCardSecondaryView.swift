//
//  VidCardSecondaryView.swift
//  AnimeHolic
//
//  Created by Puras Handharmahua on 15/07/21.
//

import SwiftUI

struct VidCardSecondaryView: View {
    
    // MARK: PROPERTIES
    let video: VideosModel
    
    var body: some View {
        ZStack {
            if let url = video.imageUrl {
                ImageLoaderView(
                    urlString: url,
                    key: "\(video.id)",
                    title: video.title ?? ""
                )
            } else {
                Rectangle()
                    .fill(Color.gray)
                    .overlay(
                        ZStack {
                            Text("No image url")
                                .foregroundColor(.white)
                        }
                    )
            }
            VStack {
                Spacer()
                infoContainer
            }
        }
        .cornerRadius(15)
        .clipped()
    }
}

// MARK: - COMPONENTS
extension VidCardSecondaryView {
    var infoContainer: some View {
        VStack(spacing: 5) { // START: INFO CONTAINER
            Text(video.title ?? "")
                .font(.headline)
                .fontWeight(.semibold)
                .lineLimit(1)
                .foregroundColor(.white)
                .padding(.horizontal)
            HStack { // START: RATING STAR'S CONTAINER
                ForEach(0..<getFullStar()) { _ in
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }
                if getHalfStar() == 1 {
                    Image(systemName: "star.leadinghalf.fill")
                        .foregroundColor(.yellow)
                }
                ForEach(0..<getUnfilledStar()) { _ in
                    Image(systemName: "star")
                        .foregroundColor(.yellow)
                }
            } // END: RATING STAR'S CONTAINER
            .frame(maxWidth: .infinity)
        } // END: INFO CONTAINER
        .padding(.vertical,10)
        .background(Color.black.opacity(0.5))
    }
}


// MARK: - FUNCTIONS

extension VidCardSecondaryView {
    /// Get the number of Full Star rating
    ///
    /// This function return how many full star from a 5-Star  rating
    ///
    /// - Returns: Returns an Int
    private func getFullStar() -> Int {
        
        guard let rating = video.score else {return 0}
        
        return Int(rating/2)
    }
    
    /// Get the number of Half Star
    ///
    /// This function return how many half star from a 5-Star rating.
    /// Would return either 1 or 0 (There will only be 1 Half-Star on 5-Star Rating)
    ///
    /// - Returns: Returns an Int either 0 or 1
    private func getHalfStar() -> Int {
        
        guard let rank = video.score else {return 0}
        
        let rating = Float(rank)
        let val = (rating/2).truncatingRemainder(dividingBy: 1.0)
        
        return val >= 0.5 ? 1 : 0
    }
    
    
    /// Get the number of empty star
    /// - Returns: Returns an Int
    private func getUnfilledStar() -> Int {
        return 5 - getFullStar() - getHalfStar()
    }
}

struct VidCardSecondaryView_Previews: PreviewProvider {
    static var previews: some View {
        VidCardSecondaryView(video: VideosModel.dummyData[0])
            .frame(width: 200, height: 300)
            .previewLayout(.sizeThatFits)
    }
}
