//
//  VideoCardPrimary.swift
//  AnimeHolic
//
//  Created by Puras Handharmahua on 12/07/21.
//

import SwiftUI

struct VideoCardPrimary: View {
    var body: some View {
        GeometryReader { proxy in
            
            let val = proxy.frame(in: .global).minX
            
            RoundedRectangle(cornerRadius: 10)
                .fill(isChange(proxy) ? Color.green : Color.blue)
                .overlay(
                    Text("\(val)")
                )
        }
    }
}

extension VideoCardPrimary {
    private func isChange(_ proxy: GeometryProxy) -> Bool {
        let val = proxy.frame(in: .global).minX
        
        if val > 0 && val < 100 {
            return true
        }
        return false
    }
}

struct VideoCardPrimary_Previews: PreviewProvider {
    static var previews: some View {
        VideoCardPrimary()
    }
}
