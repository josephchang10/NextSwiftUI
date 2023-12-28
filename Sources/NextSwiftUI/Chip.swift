//
//  Chip.swift
//  
//
//  Created by Jiafu Zhang on 12/28/23.
//

import SwiftUI

/// A Chip is a small block of essential information that represent an input, attribute, or action.
public struct Chip: View {
    let backgroundColor: Color
    let borderColor: Color
    let borderWidth: CGFloat
    let content: AnyView
    
    public var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .padding()
            .overlay {
                Capsule()
                    .stroke(borderColor, lineWidth: borderWidth)
            }
            .background(backgroundColor)
            .clipShape(Capsule())
    }
    
    public init(content: some View, backgroundColor: Color? = nil, borderColor: Color? = nil, borderWidth: CGFloat? = nil) {
        self.backgroundColor = backgroundColor ?? .next.defaultColor
        self.borderColor = borderColor ?? .clear
        self.borderWidth = borderWidth ?? 0
        self.content = AnyView(content)
    }
}

#Preview {
    Chip(content: Text("Hello, World!"))
        .preferredColorScheme(.dark)
}

#Preview {
    Chip(content: Text("Hello, World!"), backgroundColor: .clear, borderColor: .white.opacity(0.3), borderWidth: 1)
        .preferredColorScheme(.dark)
}
