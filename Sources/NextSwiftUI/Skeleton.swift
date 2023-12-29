//
//  Skeleton.swift
//
//
//  Created by Jiafu Zhang on 12/29/23.
//

import SwiftUI

/// Skeleton is a placeholder to show a loading state
public struct Skeleton: View {
    private let animation: Animation
    private var content: AnyView?
    private let gradient: Gradient
    private let min, max: CGFloat
    @State private var isInitialState = true
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.layoutDirection) private var layoutDirection
    
    private var background: some View {
        if let content {
            content
        } else if colorScheme == .dark {
            AnyView(Color.next.content2)
        } else {
            AnyView(Color.next.content3)
        }
    }

    /// The default animation effect.
    public static let defaultAnimation =
    Animation.easeInOut(duration: 1.5).delay(0.25).repeatForever(autoreverses: false)

    // A default gradient for the animated mask.
    public static let defaultGradient = Gradient(colors: [
        .black.opacity(0.3), // translucent
        .black, // opaque
        .black.opacity(0.3) // translucent
    ])

    /*
     Calculating the gradient's animated start and end unit points:
     min,min
        \
         ┌───────┐         ┌───────┐
         │0,0    │ Animate │       │  "forward" gradient
     LTR │       │ ───────►│    1,1│  / // /
         └───────┘         └───────┘
                                    \
                                  max,max
                max,min
                  /
         ┌───────┐         ┌───────┐
         │    1,0│ Animate │       │  "backward" gradient
     RTL │       │ ───────►│0,1    │  \ \\ \
         └───────┘         └───────┘
                          /
                       min,max
     */

    /// The start unit point of our gradient, adjusting for layout direction.
    var startPoint: UnitPoint {
        if layoutDirection == .rightToLeft {
            isInitialState ? UnitPoint(x: max, y: 0) : UnitPoint(x: 0, y: 1)
        } else {
            isInitialState ? UnitPoint(x: min, y: 0) : UnitPoint(x: 1, y: 1)
        }
    }

    /// The end unit point of our gradient, adjusting for layout direction.
    var endPoint: UnitPoint {
        if layoutDirection == .rightToLeft {
            isInitialState ? UnitPoint(x: 1, y: 0) : UnitPoint(x: min, y: 1)
        } else {
            isInitialState ? UnitPoint(x: 0, y: 0) : UnitPoint(x: max, y: 1)
        }
    }

    public var body: some View {
        background
            .mask(LinearGradient(gradient: gradient, startPoint: startPoint, endPoint: endPoint))
            .animation(animation, value: isInitialState)
            .onAppear {
                isInitialState = false
            }
    }
    
    /// Initializes his modifier with a custom animation,
    /// - Parameters:
    ///   - animation: A custom animation. Defaults to ``Skeleton/defaultAnimation``.
    ///   - gradient: A custom gradient. Defaults to ``Skeleton/defaultGradient``.
    ///   - bandSize: The size of the animated mask's "band". Defaults to 0.3 unit points, which corresponds to
    /// 30% of the extent of the gradient.
    public init(
        animation: Animation = Self.defaultAnimation,
        gradient: Gradient = Self.defaultGradient,
        bandSize: CGFloat = 1
    ) {
        self.animation = animation
        self.gradient = gradient
        // Calculate unit point dimensions beyond the gradient's edges by the band size
        min = 0 - bandSize
        max = 1 + bandSize
    }
    
    public init(
        _ content: some View,
        animation: Animation = Self.defaultAnimation,
        gradient: Gradient = Self.defaultGradient,
        bandSize: CGFloat = 1
    ) {
        self.init(animation: animation, gradient: gradient, bandSize: bandSize)
        self.content = AnyView(content)
    }
}

#Preview {
    Skeleton()
//        .preferredColorScheme(.dark)
}
