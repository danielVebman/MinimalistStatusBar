//
//  BatteryView.swift
//  MinimalistStatusBar
//
//  Created by Daniel Vebman on 8/14/17.
//  Copyright © 2017 Daniel Vebman. All rights reserved.
//

import Foundation
import UIKit

class BatteryView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupBattery()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupBattery() {
        var batteryLevel = CGFloat(UIDevice.current.batteryLevel)
        if !UIDevice.current.isBatteryMonitoringEnabled { batteryLevel = 0 }
        
        let outside = UIBezierPath()
        outside.move(to: CGPoint(x: 85 / 5, y: 0 / 5))
        outside.addLine(to: CGPoint(x: 5 / 5, y: 0 / 5))
        outside.addArc(withCenter: CGPoint(x: 5 / 5, y: 5 / 5), radius: 5 / 5, startAngle: 3 * CGFloat.pi / 2, endAngle: CGFloat.pi, clockwise: false)
        outside.addLine(to: CGPoint(x: 0 / 5, y: 45 / 5))
        outside.addArc(withCenter: CGPoint(x: 5 / 5, y: 45 / 5), radius: 5 / 5, startAngle: CGFloat.pi, endAngle: CGFloat.pi / 2, clockwise: false)
        outside.addLine(to: CGPoint(x: 85 / 5, y: 50 / 5))
        outside.addArc(withCenter: CGPoint(x: 85 / 5, y: 45 / 5), radius: 5 / 5, startAngle: CGFloat.pi / 2, endAngle: 0, clockwise: false)
        outside.addLine(to: CGPoint(x: 90 / 5, y: 35 / 5))
        outside.addLine(to: CGPoint(x: 95 / 5, y: 35 / 5))
        outside.addLine(to: CGPoint(x: 95 / 5, y: 15 / 5))
        outside.addLine(to: CGPoint(x: 90 / 5, y: 15 / 5))
        outside.addLine(to: CGPoint(x: 90 / 5, y: 10 / 5))
        outside.addArc(withCenter: CGPoint(x: 85 / 5, y: 5 / 5), radius: 5 / 5, startAngle: 0, endAngle: 3 * CGFloat.pi / 2, clockwise: false)
        outside.close()
        outside.lineWidth = 1
        
        let superLayer = CALayer()
        
        let outsideLayer = CAShapeLayer()
        outsideLayer.path = outside.cgPath
        outsideLayer.fillColor = UIColor.clear.cgColor
        outsideLayer.strokeColor = tintColor.cgColor
        outsideLayer.lineWidth = 1
        superLayer.addSublayer(outsideLayer)
        
        let insideLayer = CAShapeLayer()
        let rectPath = UIBezierPath(rect: CGRect(x: 4.5 / 5 + 1, y: 4.5 / 5 + 1, width: 81 * batteryLevel / 5 - 2, height: 41 / 5 - 2))
        insideLayer.path = rectPath.cgPath
        insideLayer.fillColor = tintColor.cgColor
        superLayer.addSublayer(insideLayer)
        
        superLayer.position.x += 0.5
        superLayer.position.y += 0.5
        
        let v = UIView(frame: CGRect(x: frame.width - 95 / 5, y: 0, width: 95 / 5, height: 50 / 5))
        v.center.y = frame.height / 2
        v.layer.addSublayer(superLayer)
        v.backgroundColor = UIColor.clear
        addSubview(v)
    }
    
    func update() {
        subviews.forEach { $0.removeFromSuperview() }
        setupBattery()
    }
    
    override var tintColor: UIColor! {
        willSet(color) {
            update()
        }
    }
}
