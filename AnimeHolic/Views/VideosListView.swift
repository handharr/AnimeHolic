//
//  VideosListView.swift
//  AnimeHolic
//
//  Created by Puras Handharmahua on 09/07/21.
//

import SwiftUI

struct VideosListView: View {
    
    // MARK: BODY
    
    var body: some View {
        ScrollView { // START: MAIN VSCROLLV
            VStack { // START: MAIN VSTACK
                VideoSectionPrimary(sectionTitle: "Top Picks For You")
                VideoSectionPrimary(sectionTitle: "Top Picks For You")
            } // END: MAIN VSTACK
        } // END: MAIN VSCROLLV
        .frame(maxHeight: .infinity)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems( // START: NAVBARITEMS
            leading: leadingNavBar,
            trailing: trailingNavBar
        ) // END: NAVBARITEMS
    }
}

// MARK: - COMPONENTS

extension VideosListView {
    var leadingNavBar: some View {
        Text("AnimeHolic")
            .foregroundColor(.blue)
            .font(.title2)
            .fontWeight(.semibold)
    }
    var trailingNavBar: some View {
        NavigationLink( // START: SEARCH NAVLINK
            destination: Text("Destination"),
            label: {
                Image(systemName: "magnifyingglass")
            }) // END: SEARCH NAVLINK
    }
}

// MARK: - FUNCTIONS

extension VideosListView {

}

// MARK: - PREVIEW

struct VideosListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            VideosListView()
        }
    }
}
