//
//  Shakeable.swift
//  TacoPop
//
//  Created by NK on 18.05.17.
//  Copyright © 2017 Nikolay Kolesnikov. All rights reserved.
//

import UIKit

protocol Shakeable {}

extension Shakeable where Self: UIView {
    func shake() {
        let anim = CABasicAnimation(keyPath: "position")
        anim.duration = 0.05
        anim.repeatCount = 5
        anim.autoreverses = true
        anim.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 4.0, y: self.center.y - 2.0))
        anim.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x + 4.0, y: self.center.y + 2.0))
        layer.add(anim, forKey: "position")
    }
}
