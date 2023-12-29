//
//  Spinner.swift
//  
//
//  Created by Jiafu Zhang on 12/29/23.
//

import SwiftUI

/// Spinner express an unspecified wait time or display the length of a process.
public struct Spinner: View {
    public var body: some View {
        CircularProgressView(track: Color.clear)
    }
}

#Preview {
    Spinner()
}
