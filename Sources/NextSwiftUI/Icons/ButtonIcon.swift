//
//  SwiftUIView.swift
//  
//
//  Created by Jiafu Zhang on 12/30/23.
//

import SwiftUI

public struct ButtonIcon: View {
    private let content: AnyView
    
    public var body: some View {
        content
            .padding(50 / 4)
            .background {
                Circle()
                    .fill(
                        LinearGradient(colors: [
                            .white.opacity(0),
                            .white.opacity(0.52)
                        ], startPoint: .top, endPoint: .bottom)
                        .opacity(0.5)
                    )
            }
            .overlay {
                Circle()
                    .stroke(
                        LinearGradient(colors: [
                            .white.opacity(0.2),
                            .white.opacity(0)
                        ], startPoint: .init(x: 0.25, y: 0), endPoint: .init(x: 0.75, y: 1))
                    )
            }
    }
    
    public init(_ content: some View) {
        self.content = AnyView(content)
    }
}

#Preview {
    ButtonIcon(Image(systemName: "arrow.left.arrow.right"))
        .backgroundCircles()
        .preferredColorScheme(.dark)
}
