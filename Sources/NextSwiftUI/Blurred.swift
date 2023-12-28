//
//  Blurred.swift
//
//
//  Created by Jiafu Zhang on 12/28/23.
//

import SwiftUI

public struct BlurredBackgroundModifier: ViewModifier {
    public enum Amount {
        case middle
        case large
        
        var radius: CGFloat {
            switch self {
            case .middle:
                12
            case .large:
                16
            }
        }
    }
    
    public func body(content: Content) -> some View {
        ZStack {
            content
                .blur(radius: 16)
            content
        }
    }
}

public extension View {
    func blurred(_ amount: BlurredBackgroundModifier.Amount) -> some View {
        modifier(BlurredBackgroundModifier())
    }
}

#Preview {
    AngularGradient.next.anguar
        .padding(40)
        .blurred(.large)
}
