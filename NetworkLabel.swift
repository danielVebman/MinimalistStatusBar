//
//  TemperatureView.swift
//  MinimalistStatusBar
//
//  Created by Daniel Vebman on 8/14/17.
//  Copyright © 2017 Daniel Vebman. All rights reserved.
//

import Foundation
import UIKit

class NetworkLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        textAlignment = .right
        font = UIFont(name: "FontAwesome", size: 15)
        update()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getNetworkStatusIcon() -> String {
        let status = Reachability()?.currentReachabilityStatus
        switch status! {
        case Reachability.NetworkStatus.reachableViaWiFi:
            return "\u{f1eb}"
        case Reachability.NetworkStatus.reachableViaWWAN:
            return "\u{f012}"
        case Reachability.NetworkStatus.notReachable:
            return "\u{f05c}"
        }
    }
    
    func update() {
        text = getNetworkStatusIcon()
    }
    
}
