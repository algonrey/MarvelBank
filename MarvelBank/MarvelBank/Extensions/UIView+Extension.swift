//
//  UIView+Extension.swift
//  MarvelBank
//
//  Created by Berto on 22/1/22.
//

import Foundation
import UIKit

extension UIView {
    
    /// Infinite rotation of the view itself
    func rotate(){
        let rotation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotation.toValue = NSNumber(value: Double.pi * 2)
        rotation.duration = 1
        rotation.isCumulative = true
        rotation.repeatCount = Float.greatestFiniteMagnitude
        self.layer.add(rotation, forKey: "rotationAnimation")
    }
}
