//
//  File.swift
//
//
//  Created by Jiafu Zhang on 12/20/23.
//

import SwiftUI

extension Color {
    struct Next {
        static let greenCircle = Color(uiColor: .init(named: "greenCircle", in: .module, compatibleWith: nil)!)
        static let pinkCircle = Color(uiColor: .init(named: "pinkCircle", in: .module, compatibleWith: nil)!)
        static let backgroundColor = Color(uiColor: .init(named: "backgroundColor", in: .module, compatibleWith: nil)!)
        static let backgroundColor2 = Color(uiColor: .init(named: "backgroundColor2", in: .module, compatibleWith: nil)!)
    }
    
    static var next: Next.Type { Next.self }
}
