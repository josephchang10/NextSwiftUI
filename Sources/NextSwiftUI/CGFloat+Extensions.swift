//
//  CGFloat+Extensions.swift
//
//
//  Created by Jiafu Zhang on 12/28/23.
//

#if canImport(AppKit)
import AppKit
#else
import UIKit
#endif

public extension CGFloat {
    // Converts the value from rem to points based on the preferred font size for .body text style.
    static func rem(_ n: Self) -> Self {
        // Retrieve the preferred font size for .body text style
        #if canImport(AppKit)
        let bodyFontSize = NSFont.preferredFont(forTextStyle: .body).pointSize
        #else
        let bodyFontSize = UIFont.preferredFont(forTextStyle: .body).pointSize
        #endif
        // Convert the rem value to points
        return n * bodyFontSize
    }
    
    static func size(_ n: Self) -> Self {
        Self.rem(n / 4)
    }
    
    // Helper function to translate pixels to points in SwiftUI, considering screen density
    static func pixel(_ n: Self) -> Self {
        #if canImport(AppKit)
        let screenScale = NSScreen.main?.backingScaleFactor
        #else
        let screenScale = UIScreen.current?.scale
        #endif
        guard let screenScale else {
            return n
        }
        return screenScale * n
    }
}
