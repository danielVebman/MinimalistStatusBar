//
//  StatusBarViewController.swift
//  MinimalistStatusBar
//
//  Created by Daniel Vebman on 8/14/17.
//  Copyright © 2017 Daniel Vebman. All rights reserved.
//
import Foundation
import UIKit

class StatusBarViewController: UIViewController, FadeAnimatorDelegate {
    private var blurView: UIVisualEffectView!
    
    private var timeLabel: TimeLabel!
    private var networkLabel: NetworkLabel!
    private var batteryView: BatteryView!
    
    private var animator: FadeAnimator!
    
    init() {
        super.init(nibName: nil, bundle: nil)
        blurView = UIVisualEffectView()
        
        timeLabel = TimeLabel()
        networkLabel = NetworkLabel()
        batteryView = BatteryView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        view.frame.size.height = MinimalistStatusBar.shared.height
        
        blurView.frame = view.bounds
        view.addSubview(blurView)
        
        timeLabel.frame = view.bounds
        timeLabel.frame.origin.x -= 5
        timeLabel.alpha = 1
        view.addSubview(timeLabel)
        
        networkLabel.frame = view.bounds
        networkLabel.frame.origin.x -= 5
        networkLabel.alpha = 0
        view.addSubview(networkLabel)
        
        batteryView.frame = view.bounds
        batteryView.frame.origin.x -= 5
        batteryView.alpha = 0
        view.addSubview(batteryView)
        
        animator = FadeAnimator(views: timeLabel,networkLabel, batteryView, restingPosition: timeLabel.frame.origin)
        animator.delegate = self
        animator.startAnimationTimer(interval: 10)
        
        tintColor = UIColor.black
    }
    
    internal func animatorWillAnimate(_ animator: FadeAnimator, to view: UIView) {
        if let view = view as? TimeLabel {
            view.update()
        } else if let view = view as? NetworkLabel {
            view.update()
        } else if let view = view as? BatteryView {
            view.update()
        }
    }
    
    var tintColor: UIColor = UIColor.black {
        willSet(color) {
            timeLabel.textColor = color
            networkLabel.textColor = color
            batteryView.tintColor = color
        }
    }
    
    var isBlurViewHidden: Bool {
        get {
            return blurView.effect == nil
        }
        set(bool) {
            blurView.effect = bool ? nil : UIBlurEffect(style: .regular)
        }
    }
}
