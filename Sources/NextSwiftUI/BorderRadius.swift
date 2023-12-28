//
//  File.swift
//  
//
//  Created by Jiafu Zhang on 12/28/23.
//

import SwiftUI

enum RoundedStyle {
    case full
    
    var radius: CGFloat {
        switch self {
        case .full:
            .infinity
        }
    }
}

extension View {
    func rounded(_ style: RoundedStyle) -> some View {
        ModifiedContent(content: self, modifier: RoundedModifier(style: style))
    }
}

struct RoundedModifier: ViewModifier {
    let style: RoundedStyle
    
    func body(content: Content) -> some View {
        content
            .clipShape(RoundedRectangle(cornerRadius: style.radius))
    }
}
