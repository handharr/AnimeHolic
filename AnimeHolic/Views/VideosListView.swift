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
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    ForEach(0..<5) { item in
                        GeometryReader { proxy in
                            
                            let val = proxy.frame(in: .global).minX
                            
                            RoundedRectangle(cornerRadius: 10)
                                .fill(isChange(proxy) ? Color.green : Color.blue)
                                .overlay(
                                    Text("\(val)")
                                )
                        }
                        .frame(width: UIScreen.main.bounds.width * 0.9, height: 250)
                    }
                }
                .padding(20)
            }

        }
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
    private func isChange(_ proxy: GeometryProxy) -> Bool {
        let val = proxy.frame(in: .global).minX
        
        if val > 0 && val < 50 {
            return true
        }
        return false
    }
}

// MARK: PREVIEW

struct VideosListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            VideosListView()
        }
    }
}
