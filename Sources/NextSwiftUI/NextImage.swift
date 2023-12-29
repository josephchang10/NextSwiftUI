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
    var url: URL?
    var onCompletion: ((Result<ImageResponse, Error>) -> Void) = { _ in }
    
    public var body: some View {
        LazyImage(url: url, transaction: .init(animation: .default)) { state in
            if let image = state.image {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else {
                Skeleton(Color.next.default300)
            }
        }
        .onCompletion(onCompletion)
    }
}

#Preview {
    NextImage()
}
