//
//  ImageLoaderView.swift
//  AnimeHolic
//
//  Created by Puras Handharmahua on 18/07/21.
//

import SwiftUI

struct ImageLoaderView: View {
    
    @StateObject private var vm: ImageLoaderViewModel
    
    init(urlString: String, key: String, title: String) {
        self._vm = StateObject(
            wrappedValue: ImageLoaderViewModel(
                urlString: urlString,
                key: key,
                title: title
            )
        )
    }
    
    var body: some View {
        if vm.isLoading {
            ZStack { // START: ZTACK
                Rectangle()
                    .fill(Color.gray)
            } // END: ZTACK
        } else if let image = vm.image {
            Image(uiImage: image)
                .resizable()
        } else {
            ZStack { // START: ZTACK
                ProgressView()
            } // END: ZTACK
        }
        
    }
}

struct ImageLoaderView_Previews: PreviewProvider {
    static var previews: some View {
        ImageLoaderView(
            urlString: "https://cdn.myanimelist.net/images/anime/1134/111757.jpg?s=37c3e3cd30e8413095498f6cabcdf4b1",
            key: "41025",
            title: "Title"
        )
            .frame(width: 200, height: 300)
            .cornerRadius(15)
    }
}
