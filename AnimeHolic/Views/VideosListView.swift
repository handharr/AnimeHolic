//
//  VideosListView.swift
//  AnimeHolic
//
//  Created by Puras Handharmahua on 09/07/21.
//

import SwiftUI

struct VideosListView: View {
    
    var body: some View {
        ScrollView {
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack {
                        ForEach(0..<5) { item in
                            VideoCardPrimary()
                                .frame(width: UIScreen.main.bounds.width * 0.9, height: 250)
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                }
                
                VideoSectionPrimary(sectionTitle: "Top Picks For You")
                VideoSectionPrimary(sectionTitle: "Top Picks For You")
            }
        }
        .frame(maxHeight: .infinity)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(
            leading: leadingNavBar,
            trailing: trailingNavBar
        )
    }
}

// MARK: COMPONENTS

extension VideosListView {
    var leadingNavBar: some View {
        Text("AnimeHolic")
            .foregroundColor(.blue)
            .font(.title2)
            .fontWeight(.semibold)
    }
    var trailingNavBar: some View {
        NavigationLink(
            destination: Text("Destination"),
            label: {
                Image(systemName: "magnifyingglass")
            })
    }
}

// MARK: FUNCTIONS

extension VideosListView {

}

// MARK: PREVIEW

struct VideosListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            VideosListView()
        }
    }
}
