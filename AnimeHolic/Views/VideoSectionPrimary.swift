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
    let vidType: VideosApi
    
    @StateObject private var vm: VideosViewModel
    
    init(sectionTitle: String, vidType: VideosApi) {
        self.sectionTitle = sectionTitle
        self.vidType = vidType
        self._vm = StateObject(
            wrappedValue: VideosViewModel(withType: vidType)
        )
    }
    
    // MARK: BODY
    var body: some View {
        VStack { // START: MAIN VSTACK
            
            // TITLE
            titleSection
            
            // CONTENT
            switch(vm.state) { // START: SWITCH CASE
            case .loading:
                loadingView
            case .failed(let err):
                ZStack {
                    Text("\(err.localizedDescription)")
                }
            case .success:
                contentView
            }// END: SWITCH CASE
            
        } // END: MAIN VSTACK
    }
}

// MARK: - COMPONENTS
extension VideoSectionPrimary {
    var titleSection: some View {
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
    }
    
    var loadingView: some View {
        ZStack {
            ProgressView()
        }
    }
    
    var contentView: some View {
        // CONTENT
        ScrollView(.horizontal, showsIndicators: false) { // START: CONTENT HSCROLLV
            LazyHStack { // START: CONTENT HSTACK
                ForEach(vm.getFirstFive()) { video in
                    NavigationLink( // START: DETAIL NAVLINK
                        destination: Text("Destination"),
                        label: {
                            VidCardSecondaryView(video: video)
                                .frame(width: 200, height: 300)
                        })
                } // END: DETAIL NAVLINK
            } // END: CONTENT HSTACK
            .padding(.horizontal, 20)
        } // END: CONTENT HSCROLLV
    }
}


// MARK: - PREVIEW

struct VideoSectionPrimary_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            VideoSectionPrimary(sectionTitle: "Title", vidType: .getTopAiring)
        }
    }
}
