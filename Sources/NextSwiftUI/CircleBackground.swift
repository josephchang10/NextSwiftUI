//
//  CircleBackground.swift
//  MovieBooking
//
//  Created by Willie Yam on 2022-08-16.
//

import SwiftUI

struct CircleBackground: View {
    var body: some View {
        Circle()
            .frame(width: 300, height: 300)
            .foregroundColor(.greenCircle)
    }
}

struct CircleBackground_Previews: PreviewProvider {
    static var previews: some View {
        CircleBackground()
    }
}
