//
//  Gradients.swift
//  
//
//  Created by Jiafu Zhang on 12/20/23.
//

import SwiftUI

extension LinearGradient {
    struct Next {
        static let background = LinearGradient(gradient: Gradient(colors: [.next.background, .next.background2]), startPoint: .top, endPoint: .bottom)
    }
    
    static var next: Next.Type { Next.self }
}

extension AngularGradient {
    struct Next {
        static let anguar = AngularGradient(
            gradient: Gradient(stops: [
                .init(color: Color(#colorLiteral(red: 0, green: 0.5199999809265137, blue: 1, alpha: 1)), location: 0.0),
                .init(color: Color(#colorLiteral(red: 0.2156862745, green: 1, blue: 0.8588235294, alpha: 1)), location: 0.4),
                .init(color: Color(#colorLiteral(red: 1, green: 0.4196078431, blue: 0.4196078431, alpha: 1)), location: 0.5),
                .init(color: Color(#colorLiteral(red: 1, green: 0.1843137255, blue: 0.6745098039, alpha: 1)), location: 0.8)]),
            center: .center
        )
    }
    
    static var next: Next.Type { Next.self }
}
