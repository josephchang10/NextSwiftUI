//
//  CircularProgressView.swift
//  
//
//  Created by Jiafu Zhang on 12/22/23.
//

import SwiftUI

/// Circular progress views are utilized to indicate an undetermined wait period or visually represent the duration of a process.
public struct CircularProgressView: View {
    public enum Size {
        case small
        case middle
        case large
        
        var width: CGFloat {
            switch self {
            case .small:
                20
            case .middle:
                40
            case .large:
                60
            }
        }
        
        var height: CGFloat {
            width
        }
        
        var lineWidth: CGFloat {
            switch self {
            case .small:
                4
            case .middle:
                6
            case .large:
                8
            }
        }
    }
    
    // MARK: - Properties
    @State private var degree = 270
    @State private var spinnerLength: CGFloat
    @State private var animate: Bool
    
    let size: Size
    
    private var track: AnyView
    
    public var body: some View {
        ZStack {
            track
            Circle()
                .trim(from: 0.0, to: spinnerLength)
                .stroke(LinearGradient(colors: [.red, .blue], startPoint: .topLeading, endPoint: .bottomTrailing), style: StrokeStyle(lineWidth: size.lineWidth, lineCap: .round, lineJoin: .round))
                .animation(Animation.easeIn(duration: 1.5).repeatForever(autoreverses: true), value: spinnerLength)
                .rotationEffect(Angle(degrees: Double(degree)))
                .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false), value: degree)
                .onAppear {
                    if animate {
                        degree = 270 + 360
                        spinnerLength = 0
                    }
                }
        }
        .frame(width: size.width, height: size.height)
    }
    
    public init(spinnerLength: CGFloat = 0.6, size: Size = .middle) {
        animate = true
        self.spinnerLength = spinnerLength
        self.size = size
        self.track = AnyView(Circle().stroke(
                Color.next.default300.opacity(0.5),
                lineWidth: size.lineWidth))
    }
    
    public init(spinnerLength: CGFloat = 0.6, size: Size = .middle, track: some View) {
        self.init(spinnerLength: spinnerLength, size: size)
        self.track = AnyView(track)
    }
    
    public init<V>(value: V, size: Size = .middle) where V: BinaryFloatingPoint {
        self.init(spinnerLength: CGFloat(value), size: size)
    }
}

#Preview {
    VStack(spacing: 50) {
        CircularProgressView(size: .small, track: Color.clear)
        CircularProgressView()
        CircularProgressView(size: .large)
    }
    .preferredColorScheme(.dark)
}

#Preview {
    CircularProgressView(value: Float(60) / 100)
}
