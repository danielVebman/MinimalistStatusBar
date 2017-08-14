//
//  FadeAnimator.swift
//  MinimalistStatusBar
//
//  Created by Daniel Vebman on 8/15/17.
//  Copyright © 2017 Daniel Vebman. All rights reserved.
//

import Foundation
import UIKit

class FadeAnimator {
    var delegate: FadeAnimatorDelegate?
    
    private(set) var views: [UIView]!
    
    private(set) var currentView: UIView!
    private var restingPosition: CGPoint!
    
    init(views: UIView..., restingPosition: CGPoint) {
        self.views = views
        currentView = views.first!
        self.restingPosition = restingPosition
    }
    
    func startAnimationTimer(interval: TimeInterval) {
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: #selector(animateNext), userInfo: nil, repeats: true)
    }
    
    @objc func animateNext() {
        if views.count < 2 { return }
        let currentIndex = views.index(of: currentView)!
        var nextIndex = currentIndex + 1
        if nextIndex > views.count - 1 {
            nextIndex = 0
        }
        let nextView = views[nextIndex]
        
        delegate?.animatorWillAnimate(self, to: nextView)
        
        UIView.animate(withDuration: 1) {
            self.currentView.frame.origin.x -= 10
            self.currentView.alpha = 0
        }
        
        nextView.frame.origin.x = restingPosition.x + 10
        UIView.animate(withDuration: 1.5, delay: 1.5, options: [], animations: {
            nextView.frame.origin.x = self.restingPosition.x
            nextView.alpha = 1
        }, completion: { (Bool) in
            self.currentView = nextView
        })
    }
}

protocol FadeAnimatorDelegate {
    func animatorWillAnimate(_ animator: FadeAnimator, to view: UIView)
}
