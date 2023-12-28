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
    
    let radius: CGFloat
    
    public func body(content: Content) -> some View {
        ZStack {
            content
                .scaleEffect(1.05)
                .blur(radius: radius)
            content
        }
    }
    
    init(amount: Amount?) {
        radius = amount?.radius ?? 8
    }
}

public extension View {
    func blurred(_ amount: BlurredBackgroundModifier.Amount? = nil) -> some View {
        modifier(BlurredBackgroundModifier(amount: amount))
    }
}

#Preview {
    AngularGradient.next.anguar
        .padding(40)
        .blurred(.large)
}
