//
//  MinimalistStatusBar.swift
//  MinimalistStatusBar
//
//  Created by Daniel Vebman on 8/14/17.
//  Copyright © 2017 Daniel Vebman. All rights reserved.
//

import Foundation
import UIKit

final class MinimalistStatusBar {
    static var shared = MinimalistStatusBar()
    
    private var window: UIWindow!
    private(set) var statusBar: StatusBarViewController!
    
    private init() {
        window = UIWindow(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIApplication.shared.statusBarFrame.height))
        window.windowLevel = UIWindowLevelStatusBar + 1
        statusBar = StatusBarViewController()
        window.rootViewController = statusBar
    }
    
    var height: CGFloat { return window.bounds.height }
    
    var isHidden = false {
        didSet(bool) {
            window.isHidden = bool
        }
    }
    
}
