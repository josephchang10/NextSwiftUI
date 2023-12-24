//
//  AngularButtonView.swift
//
//
//  Created by Jiafu Zhang on 12/23/23.
//

import SwiftUI

public struct AngularButtonView: View {
    let content: AnyView
    
    public var body: some View {
        content
            .fontWeight(.semibold)
            .frame(maxHeight: 50)
            .background(
                ZStack {
                    angularGradient
                    LinearGradient(gradient: Gradient(colors: [Color.next.systemBackground.opacity(1), Color.next.systemBackground.opacity(0.6)]), startPoint: .top, endPoint: .bottom)
                        .cornerRadius(20)
                        .blendMode(.softLight)
                }
            )
            .frame(height: 50)
            .accentColor(.primary.opacity(0.7))
    }
    
    private var angularGradient: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(.clear)
            .overlay(AngularGradient.next.anguar)
            .padding(6)
            .blur(radius: 20)
    }
    
    public init(content: any View) {
        self.content = AnyView(content)
    }
}


#Preview {
    AngularButtonView(content: Text("Hello World!"))
}
