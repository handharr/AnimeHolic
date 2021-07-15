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
    
    @StateObject private var vm = VideosViewModel(service: VideosService())
    
    // MARK: BODY
    var body: some View {
        // TITLE
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
            
            switch(vm.state) {
            case .loading:
                HStack {
                    ProgressView()
                }
            case .failed(let err):
                HStack {
                    Text("\(err.localizedDescription)")
                }
            case .success:
                // CONTENT
                ScrollView(.horizontal, showsIndicators: false) { // START: CONTENT HSCROLLV
                    LazyHStack { // START: CONTENT HSTACK
                        ForEach(vm.getFirstFive()) { video in
                            NavigationLink( // START: DETAIL NAVLINK
                                destination: Text("Destination"),
                                label: {
                                    VidCardSecondaryView(video: video)
                                })
                        } // END: DETAIL NAVLINK
                    } // END: CONTENT HSTACK
                    .padding(.horizontal, 20)
                } // END: CONTENT HSCROLLV
                .frame(height: 300)
            }
            
        } // END: MAIN VSTACK
        .onAppear(perform: {
            vm.getVideos(withType: vidType)
        })
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


/*
 
 switch(vm.state) {
 case .loading:
     ProgressView()
 case .failed(let err):
     Text("\(err.localizedDescription)")
         .frame(width: .infinity, height: .infinity, alignment: .center)
 case .success:
     // CONTENT
     ScrollView(.horizontal, showsIndicators: false) { // START: CONTENT HSCROLLV
         LazyHStack { // START: CONTENT HSTACK
             ForEach(vm.getFirstFive()) { video in
                 NavigationLink( // START: DETAIL NAVLINK
                     destination: Text("Destination"),
                     label: {
                         VidCardSecondaryView(video: video)
                     })
             } // END: DETAIL NAVLINK
         } // END: CONTENT HSTACK
         .padding(.horizontal, 20)
     } // END: CONTENT HSCROLLV
     .onAppear(perform: {
         vm.getVideos(withType: vidType)
     })
     .frame(height: 300)
 }
 
 */
