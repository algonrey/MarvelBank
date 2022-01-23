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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    public func rotate(){
        self.loadingImg.rotate()
    }
    
    
}
