//
//  View+Extensions.swift
//
//
//  Created by Jiafu Zhang on 12/28/23.
//

import SwiftUI

extension View {
    func height(size: CGFloat) -> some View {
        frame(height: size.sizeToRem)
    }
    
    func offsetY(size: CGFloat) -> some View {
        offset(y: size.sizeToRem)
    }
    
    func paddingHorizontal(size: CGFloat) -> some View {
        padding(.horizontal, size.sizeToRem)
    }
}
