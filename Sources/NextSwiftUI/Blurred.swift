//
//  Blurred.swift
//
//
//  Created by Jiafu Zhang on 12/28/23.
//

import SwiftUI

struct BlurredBackgroundModifier: ViewModifier {
    func body(content: Content) -> some View {
        ZStack {
            content
                .blur(radius: 20)
            content
        }
    }
}

public extension View {
    func blurred() -> some View {
        modifier(BlurredBackgroundModifier())
    }
}

#Preview {
    AngularGradient.next.anguar
        .padding(40)
        .blurred()
}
