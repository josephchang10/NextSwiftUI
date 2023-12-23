//
//  Colors.swift
//
//
//  Created by Jiafu Zhang on 12/20/23.
//

import SwiftUI

extension Color {
    struct Next {
        static let background = named("background")
        static let background2 = named("background2")
        static let greenCircle = named("greenCircle")
        static let cyan = named("cyan")
        static let grey = named("grey")
        static let pinkCircle = named("pinkCircle")
        static let majenta = named("majenta")
        static let pink = named("pink")
        
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
