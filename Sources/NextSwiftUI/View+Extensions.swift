//
//  View+Extensions.swift
//
//
//  Created by Jiafu Zhang on 12/28/23.
//

import SwiftUI

public extension View {
    func height(size: CGFloat) -> some View {
        frame(height: .size(size))
    }
    
    func offsetY(size: CGFloat) -> some View {
        offset(y: .size(size))
    }
    
    func paddingHorizontal(size: CGFloat) -> some View {
        padding(.horizontal, .size(size))
    }
}
