//
//  NextImage.swift
//
//
//  Created by Jiafu Zhang on 12/29/23.
//

import SwiftUI
import Nuke
import NukeUI

struct NextImage: View {
    var onCompletion: ((Result<ImageResponse, Error>) -> Void) = { _ in }
    
    var body: some View {
        LazyImage(url: URL(string: "https://replicate.delivery/pbxt/JkUYWp60oNwz1SF9AJvJPv7upLqucTyaeCxQ07qZGijlDKxt/face_swap_09.jpg"), transaction: .init(animation: .default)) { state in
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
