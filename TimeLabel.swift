//
//  TimeLabel.swift
//  MinimalistStatusBar
//
//  Created by Daniel Vebman on 8/14/17.
//  Copyright © 2017 Daniel Vebman. All rights reserved.
//

import Foundation
import UIKit

class TimeLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        textAlignment = .right
        textColor = UIColor.black
        font = UIFont.systemFont(ofSize: 12)
        update()
        syncTimer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func getCurrentTime() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: Date())
    }
    
    @objc func update() {
        text = getCurrentTime()
    }
    
    private func syncTimer() {
        let wait = 60 - (Date().timeIntervalSince1970).truncatingRemainder(dividingBy: 60)
        Timer.scheduledTimer(withTimeInterval: wait, repeats: false) { (_) in
            self.startTimer()
        }
    }
    
    private func startTimer() {
        Timer.scheduledTimer(timeInterval: 60, target: self, selector: #selector(update), userInfo: nil, repeats: true)
    }
}
