//
//  VideoSectionPrimary.swift
//  AnimeHolic
//
//  Created by Puras Handharmahua on 12/07/21.
//

import SwiftUI

struct VideoSectionPrimary: View {
    
    // MARK: PROPERTIES
    let sectionTitle: String
    let rating = 5.0
    
    // MARK: BODY
    var body: some View {
        VStack { // START: MAIN VSTACK
            HStack { // START: TITLE HSTACK
                Text(sectionTitle)
                    .font(.headline)
                    .bold()
                Spacer()
                NavigationLink( // START: BROWSE NAVLINK
                    destination: Text("Destination"),
                    label: {
                        Image(systemName: "chevron.right")
                            .foregroundColor(.accentColor)
                            .scaledToFit()
                    }) // END: BROWSE NAVLINK
            } // END: TITLE HSTACK
            .padding()
            
            ScrollView(.horizontal, showsIndicators: false) { // START: CONTENT HSCROLLV
                LazyHStack { // START: CONTENT HSTACK
                    ForEach(0..<5) { _ in
                        NavigationLink( // START: DETAIL NAVLINK
                            destination: Text("Destination"),
                            label: {
                                cardView
                            })
                    } // END: DETAIL NAVLINK
                } // END: CONTENT HSTACK
                .padding(.horizontal, 20)
            } // END: CONTENT HSCROLLV
            .frame(height: 300)
        } // END: MAIN VSTACK
    }
}

// MARK: - COMPONENTS
extension VideoSectionPrimary {
    
    var cardView: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(Color.green)
            .frame(width: 200)
            .overlay(
                VStack() { // START: OVERLAY CONTAINER
                    Spacer()
                    VStack(spacing: 5) { // START: INFO CONTAINER
                        Text("Ini Judul")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .lineLimit(1)
                            .foregroundColor(.white)
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
                } // END: OVERLAY CONTAINER
                .cornerRadius(10)
            )
    }
}

// MARK: - FUNCTIONS

extension VideoSectionPrimary {
    
    /// Get the number of Full Star rating
    ///
    /// This function return how many full star from a 5-Star  rating
    ///
    /// - Returns: Returns an Int
    private func getFullStar() -> Int {
        return Int(rating/2)
    }
    
    /// Get the number of Half Star
    ///
    /// This function return how many half star from a 5-Star rating.
    /// Would return either 1 or 0 (There will only be 1 Half-Star on 5-Star Rating)
    ///
    /// - Returns: Returns an Int either 0 or 1
    private func getHalfStar() -> Int {
        let val = (rating/2).truncatingRemainder(dividingBy: 1.0)
        
        return val >= 0.5 ? 1 : 0
    }
    
    
    /// Get the number of empty star
    /// - Returns: Returns an Int
    private func getUnfilledStar() -> Int {
        return 5 - getFullStar() - getHalfStar()
    }
}


// MARK: - PREVIEW

struct VideoSectionPrimary_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            VideoSectionPrimary(sectionTitle: "Title")
        }
    }
}
