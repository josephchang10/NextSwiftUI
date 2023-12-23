//
//  PrimaryButtonView.swift
//
//
//  Created by Jiafu Zhang on 12/22/23.
//

import SwiftUI

public struct PrimaryButtonView: View {
    let button: AnyView
    
    var borderColors: [Color] = [.next.pink, .next.pink.opacity(0), .next.pink.opacity(0)]
    var gradient: [Color] = [.next.majenta, .next.background]
    
    public var body: some View {
        button
            .buttonStyle(.plain)
            .font(.subheadline.weight(.bold))
            .foregroundColor(.white)
            .padding()
            .background(LinearGradient(colors: gradient, startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(10)
            .overlay {
                GeometryReader(content: { geometry in
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(LinearGradient(colors: borderColors, startPoint: .topLeading, endPoint: .bottomTrailing), style: StrokeStyle(lineWidth: 2))
                        .frame(width: geometry.size.width - 1, height: geometry.size.height - 1)
                })
            }
    }
    
    public init(button: any View) {
        self.button = AnyView(button)
    }
}

#Preview {
    PrimaryButtonView(button: Button(action: {}, label: {
        Text("Hello, World!")
    }))
}
