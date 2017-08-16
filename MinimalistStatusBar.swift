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
    
    private let animationDuration = TimeInterval(UINavigationControllerHideShowBarDuration)
    
    private init() {
        window = UIWindow(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIApplication.shared.statusBarFrame.height))
        window.windowLevel = UIWindowLevelStatusBar + 1
        statusBar = StatusBarViewController()
        window.rootViewController = statusBar
    }
    
    var height: CGFloat { return window.bounds.height }
    
    var isHidden: Bool {
        get {
            return window.isHidden
        }
        set(bool) {
            window.isHidden = bool
        }
    }
    
    func setStatusBarHidden(_ hidden: Bool, with animation: UIStatusBarAnimation) {
        if hidden {
            hideStatusBar(animation: animation)
        } else {
            showStatusBar(animation: animation)
        }
    }
    
    private func hideStatusBar(animation: UIStatusBarAnimation) {
        switch animation {
        case .fade:
            UIView.animate(withDuration: animationDuration, animations: { 
                self.window.alpha = 0
            }, completion: { (Bool) in
                self.isHidden = true
            })
        case .slide:
            UIView.animate(withDuration: animationDuration, animations: { 
                self.window.frame.origin.y = -self.window.frame.height
            }, completion: { (Bool) in
                self.isHidden = true
            })
        case .none:
            self.isHidden = true
        }
    }
    
    private func showStatusBar(animation: UIStatusBarAnimation) {
        switch animation {
        case .fade:
            if isHidden {
                window.alpha = 0
                window.isHidden = false
                window.frame.origin.y = 0
            }
            UIView.animate(withDuration: animationDuration, animations: { 
                self.window.alpha = 1
            })
        case .slide:
            if isHidden {
                window.alpha = 1
                window.isHidden = false
                window.frame.origin.y = -window.frame.height
            }
            UIView.animate(withDuration: animationDuration, animations: { 
                self.window.frame.origin.y = 0
            })
        case .none:
            window.alpha = 1
            isHidden = false
            window.frame.origin.y = 0
        }
    }
    
    func setBlurHidden(_ hidden: Bool, animated: Bool) {
        let block = {
            self.statusBar.isBlurViewHidden = hidden
        }
        if animated {
            UIView.animate(withDuration: animationDuration, animations: block)
        } else {
            block()
        }
    }
}
