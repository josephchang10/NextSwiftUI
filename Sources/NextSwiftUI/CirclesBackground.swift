//
//  SwiftUIView.swift
//  
//
//  Created by Jiafu Zhang on 12/20/23.
//

import SwiftUI

public struct CirclesBackground<Content: View>: View {
    @State private var animate: Bool = false
    let content: Content  // The content view that will be placed on top
    
    public var body: some View {
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
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
}

#Preview {
    CirclesBackground {
        Text("Hello, World!")
    }
    .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
}
