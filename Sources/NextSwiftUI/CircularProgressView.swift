//
//  CircularProgressView.swift
//  
//
//  Created by Jiafu Zhang on 12/22/23.
//

import SwiftUI

/// Circular progress views are utilized to indicate an undetermined wait period or visually represent the duration of a process.
public struct CircularProgressView: View {
    // MARK: - Properties
    @State private var degree = 270
    @State private var spinnerLength: CGFloat
    @State private var animate: Bool
    
    public var body: some View {
        Circle()
            .trim(from: 0.0, to: spinnerLength)
            .stroke(LinearGradient(colors: [.red, .blue], startPoint: .topLeading, endPoint: .bottomTrailing), style: StrokeStyle(lineWidth: 8.0, lineCap: .round, lineJoin: .round))
            .animation(Animation.easeIn(duration: 1.5).repeatForever(autoreverses: true), value: spinnerLength)
            .frame(width: 60, height: 60)
            .rotationEffect(Angle(degrees: Double(degree)))
            .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false), value: degree)
            .onAppear {
                if animate {
                    degree = 270 + 360
                    spinnerLength = 0
                }
            }
    }
    
    public init() {
        animate = true
        spinnerLength = 0.6
    }
    
    public init<V>(value: V) where V: BinaryFloatingPoint {
        animate = false
        spinnerLength = CGFloat(value)
    }
}

#Preview {
    CircularProgressView()
}

#Preview {
    CircularProgressView(value: Float(70) / 100)
}
