//
//  ActionButtonView.swift
//
//
//  Created by Jiafu Zhang on 12/22/23.
//

import SwiftUI

public struct ActionButtonView: View {
    let content: AnyView
    
    public var body: some View {
        content
            .padding()
            .frame(height: 44)
            .background(.linearGradient(colors: [.clear, .black.opacity(0.3)], startPoint: .topLeading, endPoint: .bottomTrailing))
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(.linearGradient(colors: [.white.opacity(0.3), .white.opacity(0.1)], startPoint: .topLeading, endPoint: .bottomTrailing))
            )
            .cornerRadius(20)
    }
    
    public init(content: any View) {
        self.content = AnyView(content)
    }
}

#Preview {
    ActionButtonView(content: Button(action: {}, label: {
        Image(systemName: "square.and.arrow.down")
    }))
}
