//
//  CirclesBackground.swift
//  
//
//  Created by Jiafu Zhang on 12/20/23.
//

import SwiftUI

struct CirclesBackgroundModifier: ViewModifier {
    @State private var animate: Bool = false
    
    func body(content: Content) -> some View {
        ZStack {
            Group {
                CircleBackground(color: .next.greenCircle)
                    .offset(x: animate ? -50 : -130, y: animate ? -30 : -100)
                    .task {
                        withAnimation(.easeInOut(duration: 7).repeatForever()) {
                            animate.toggle()
                        }
                    }
                
                CircleBackground(color: .next.pinkCircle)
                    .offset(x: animate ? 100 : 130, y: animate ? 150 : 100)
                    .task {
                        withAnimation(.easeInOut(duration: 4).repeatForever()) {
                            animate.toggle()
                        }
                    }
            }
            .blur(radius: animate ? 30 : 100)
            
            content
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            LinearGradient.next.background
        )
    }
}

extension View {
    public func backgroundCircles() -> some View {
        modifier(CirclesBackgroundModifier())
    }
}

#Preview {
    Text("Hello, World!")
        .backgroundCircles()
        .preferredColorScheme(.dark)
}
