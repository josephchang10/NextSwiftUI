//
//  Colors.swift
//
//
//  Created by Jiafu Zhang on 12/20/23.
//

import SwiftUI

extension Color {
    struct Next {
        #if os(macOS)
        static let greenCircle = Color(nsColor: NSColor(named: "greenCircle", bundle: .module)!)
        static let pinkCircle = Color(nsColor: NSColor(named: "pinkCircle", bundle: .module)!)
        static let backgroundColor = Color(nsColor: NSColor(named: "backgroundColor", bundle: .module)!)
        static let backgroundColor2 = Color(nsColor: NSColor(named: "backgroundColor2", bundle: .module)!)
        #else
        static let greenCircle = Color(uiColor: UIColor(named: "greenCircle", in: .module, compatibleWith: nil)!)
        static let pinkCircle = Color(uiColor: UIColor(named: "pinkCircle", in: .module, compatibleWith: nil)!)
        static let backgroundColor = Color(uiColor: UIColor(named: "backgroundColor", in: .module, compatibleWith: nil)!)
        static let backgroundColor2 = Color(uiColor: UIColor(named: "backgroundColor2", in: .module, compatibleWith: nil)!)
        #endif
    }
    
    static var next: Next.Type { Next.self }
}
