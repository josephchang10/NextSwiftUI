//
//  Spinner.swift
//  
//
//  Created by Jiafu Zhang on 12/29/23.
//

import SwiftUI

public struct Spinner: View {
    public var body: some View {
        CircularProgressView(track: Color.clear)
    }
}

#Preview {
    Spinner()
}
