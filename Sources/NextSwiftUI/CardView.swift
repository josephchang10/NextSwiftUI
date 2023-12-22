//
//  SwiftUIView.swift
//  
//
//  Created by Jiafu Zhang on 12/22/23.
//

import SwiftUI

public struct CardView: View {
    private var background: AnyView
    private var overlay: AnyView
    private var title: AnyView
    
    public var body: some View {
        title
            .font(.headline)
            .offset(y: -10)
            .padding()
            .frame(maxWidth: .infinity)
            .frame(height: 70)
            .background(
                Rectangle().fill(.ultraThinMaterial)
                    .blur(radius: 20)
                    .offset(y: -20)
            )
            .frame(maxHeight: .infinity, alignment: .top)
            .background(background.aspectRatio(contentMode: .fill))
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(.linearGradient(colors: [.white.opacity(0.3), .white.opacity(0.1)], startPoint: .topLeading, endPoint: .bottomTrailing))
            )
            .overlay(
                ZStack {
                    overlay
                }
                .background(.ultraThinMaterial)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.linearGradient(colors: [.white.opacity(0.3), .white.opacity(0.1)], startPoint: .topLeading, endPoint: .bottomTrailing))
                )
                .offset(y: 20)
                .frame(maxHeight: .infinity, alignment: .bottom)
            )
    }
    
    public init(title: any View, background: any View, overlay: any View) {
        self.background = AnyView(background)
        self.overlay = AnyView(overlay)
        self.title = AnyView(title)
    }
}

#Preview {
    CardView(title: Text("Sunset"), background: Color.next.backgroundColor, overlay:
                ActionButtonView(button: Button(action: {}, label: {
        Image(systemName: "square.and.arrow.down")
    }))
    )
    .preferredColorScheme(.dark)
}
