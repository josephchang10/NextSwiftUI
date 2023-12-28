//
//  View+Extensions.swift
//
//
//  Created by Jiafu Zhang on 12/28/23.
//

import SwiftUI

extension View {
    func paddingHorizontal(size: CGFloat) -> some View {
        padding(.horizontal, size.sizeToRem)
    }
    
    func height(size: CGFloat) -> some View {
        frame(height: size.sizeToRem)
    }
}
