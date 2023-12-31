//
//  NextImage.swift
//
//
//  Created by Jiafu Zhang on 12/29/23.
//

import SwiftUI
import Nuke
import NukeUI

public struct NextImage: View {
    private let url: URL?
    private let onCompletion: ((Result<ImageResponse, Error>) -> Void)
    
    public var body: some View {
        LazyImage(url: url, transaction: .init(animation: .default)) { state in
            if let image = state.image {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else {
                Skeleton()
            }
        }
        .onCompletion(onCompletion)
    }
    
    public init(url: URL?, onCompletion: ((Result<ImageResponse, Error>) -> Void)? = nil) {
        self.url = url
        self.onCompletion = onCompletion ?? { _ in }
    }
}

#Preview {
    Nuke.DataLoader.sharedUrlCache.removeAllCachedResponses()
    return NextImage(url: .init(string: "https://images.unsplash.com/photo-1665475998014-dc2ae4e93af2"))
}
