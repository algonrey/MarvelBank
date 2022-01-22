//
//  LoadingVC.swift
//  MarvelBank
//
//  Created by Berto on 22/1/22.
//

import Foundation
import UIKit

class LoadingVC: UIViewController {
    
    @IBOutlet weak var loadingImg: UIImageView!
    
    override func viewDidAppear(_ animated: Bool) {
        rotate()
    }
    
    private func rotate() {
        let rotation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotation.toValue = NSNumber(value: Double.pi * 2)
        rotation.duration = 1
        rotation.isCumulative = true
        rotation.repeatCount = Float.greatestFiniteMagnitude
        self.loadingImg.layer.add(rotation, forKey: "rotationAnimation")
    }

    
}
