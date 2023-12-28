//
//  CircleBackground.swift
//  
//
//  Created by Jiafu Zhang on 12/20/23.
//

import SwiftUI

struct CircleBackground: View {
    var color = Color.next.greenCircle
    
    var body: some View {
        Circle()
            .frame(width: 300, height: 300)
            .foregroundColor(color)
    }
}

#Preview {
    CircleBackground()
}
