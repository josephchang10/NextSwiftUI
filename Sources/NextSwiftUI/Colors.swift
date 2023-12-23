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
            #if os(macOS)
            Color(nsColor: .windowBackgroundColor)
            #else
            Color.systemBackground
            #endif
        }()
        
        // Helper function to get the Color from assets
        private static func named(_ name: String) -> Color {
            #if os(macOS)
            .init(nsColor: NSColor(named: name, bundle: .module)!)
            #else
            .init(uiColor: UIColor(named: name, in: .module, compatibleWith: nil)!)
            #endif
        }
    }
    
    static var next: Next.Type { Next.self }
}
