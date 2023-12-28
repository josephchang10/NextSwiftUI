//
//  Colors.swift
//
//
//  Created by Jiafu Zhang on 12/20/23.
//

import SwiftUI

public extension Color {
    struct Next {
        public static let background = named("background")
        public static let background2 = named("background2")
        public static let defaultColor = Color(h: .degrees(240), s: 5 / 100, l: 26 / 100)
        public static let greenCircle = named("greenCircle")
        public static let cyan = named("cyan")
        public static let grey = named("grey")
        public static let lightBlue = named("lightBlue")
        public static let lightPurple = named("lightPurple")
        public static let pinkCircle = named("pinkCircle")
        public static let purple = named("purple")
        public static let majenta = named("majenta")
        public static let pink = named("pink")
        
        static let systemBackground = {
            #if canImport(AppKit)
            Color(nsColor: .windowBackgroundColor)
            #else
            Color(.systemBackground)
            #endif
        }()
        
        // Helper function to get the Color from assets
        private static func named(_ name: String) -> Color {
            #if canImport(AppKit)
            .init(nsColor: NSColor(named: name, bundle: .module)!)
            #else
            .init(uiColor: UIColor(named: name, in: .module, compatibleWith: nil)!)
            #endif
        }
    }
    
    static var next: Next.Type { Next.self }
}

extension Color {
    // MARK: HSV initializers
    init(h: Angle, s: Double, v: Double, opacity: Double = 1) {
        self.init(hue: h.degrees / 360, saturation: s, brightness: v, opacity: opacity)
    }

    // MARK: HSL initializers
    init(h: Angle, s: Double, l: Double, opacity: Double = 1) {
        let v = l + s * min(l, 1 - l)
        self.init(h: h, s: v == 0 ? 0 : 2 * (1 - l / v), v: v, opacity: opacity)
    }
}
