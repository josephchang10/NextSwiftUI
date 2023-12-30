//
//  File.swift
//  
//
//  Created by Jiafu Zhang on 12/30/23.
//

#if canImport(UIKit)
import UIKit

extension UIWindow {
    static var key: UIWindow? {
        for scene in UIApplication.shared.connectedScenes {
            guard let windowScene = scene as? UIWindowScene else { continue }
            for window in windowScene.windows {
                if window.isKeyWindow { return window }
            }
        }
        return nil
    }
}

extension UIScreen {
    static var current: UIScreen? {
        UIWindow.key?.screen
    }
}

#endif
