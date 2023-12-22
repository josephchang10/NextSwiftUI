//
//  File.swift
//  
//
//  Created by Jiafu Zhang on 12/20/23.
//

import SwiftUI

extension LinearGradient {
    struct Next {
        static let background = LinearGradient(gradient: Gradient(colors: [.next.backgroundColor, .next.backgroundColor2]), startPoint: .top, endPoint: .bottom)
    }
    
    static var next: Next.Type { Next.self }
}