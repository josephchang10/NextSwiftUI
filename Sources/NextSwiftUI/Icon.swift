//
//  Icon.swift
//
//
//  Created by Jiafu Zhang on 12/30/23.
//

import SwiftUI

public struct Icon: View {
    private let content: AnyView
    private let outlineColor = Color(red: 189/255, green: 252/255, blue: 254/255)
    private let insideColor = Color(red: 2/255, green: 109/255, blue: 1)
    
    public var body: some View {
        content
            .padding()
            .overlay {
                Circle()
                    .fill(
                        LinearGradient(stops: [
                            .init(color: insideColor.opacity(0), location: 0.5),
                            .init(color: insideColor, location: 0.8),
                            .init(color: .init(red: 188/255, green: 0, blue: 1), location: 0.95)
                        ], startPoint: .init(x: 0.5, y: -0.2), endPoint: .init(x: 0.5, y: 1.1))
                        .opacity(0.75)
                    )
                Circle()
                    .stroke(LinearGradient(colors: [outlineColor.opacity(0.15), .white.opacity(0)], startPoint: .top, endPoint: .init(x: 0.5, y: 0.2)), lineWidth: 1)
                Circle()
                    .stroke(LinearGradient(stops: [
                        .init(color: .init(red: 189/255, green: 252/255, blue: 254/255, opacity: 0), location: 0),
                        .init(color: .init(red: 120/255, green: 161/255, blue: 232/255, opacity: 0), location: 0.4),
                        .init(color: .init(red: 39/255, green: 55/255, blue: 207/255, opacity: 0), location: 0.9),
                        .init(color: outlineColor, location: 1)
                    ], startPoint: .top, endPoint: .bottom))
            }
    }
    
    public init(content: some View) {
        self.content = AnyView(content)
    }
}

#Preview {
    Icon(content: Image(systemName: "arrow.left.arrow.right"))
        .preferredColorScheme(.dark)
}
