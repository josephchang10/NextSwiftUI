//
//  Colors.swift
//
//
//  Created by Jiafu Zhang on 12/20/23.
//

import SwiftUI

public extension Color {
    struct Next {
        @Environment(\.colorScheme) var colorScheme
        
        public static let background = named("background")
        public static let background2 = named("background2")
        public static let defaultColor = named("default")
        public static let default300 = named("default-300")
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
    init(hue: Angle, saturation: Double, value: Double, opacity: Double = 1) {
        self.init(hue: hue.degrees / 360, saturation: saturation, brightness: value, opacity: opacity)
    }

    // MARK: HSL initializers
    init(hue: Angle, saturation: Double, lightness: Double, opacity: Double = 1) {
        let value = lightness + saturation * min(lightness, 1 - lightness)
        self.init(hue: hue, saturation: value == 0 ? 0 : 2 * (1 - lightness / value), value: value, opacity: opacity)
    }
}
