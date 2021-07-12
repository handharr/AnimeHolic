//
//  VideoSectionPrimary.swift
//  AnimeHolic
//
//  Created by Puras Handharmahua on 12/07/21.
//

import SwiftUI

struct VideoSectionPrimary: View {
    
    let sectionTitle: String
    
    var body: some View {
        VStack {
            HStack {
                Text(sectionTitle)
                    .font(.headline)
                    .bold()
                Spacer()
            }
            .padding()
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    ForEach(0..<5) { _ in
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.blue)
                            .frame(width: 200)
                    }
                }
                .padding(.horizontal, 20)
            }
            .frame(height: 300)
        }
    }
}

struct VideoSectionPrimary_Previews: PreviewProvider {
    static var previews: some View {
        VideoSectionPrimary(sectionTitle: "Title")
    }
}
