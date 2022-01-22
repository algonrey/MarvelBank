//
//  LoadingManager.swift
//  MarvelBank
//
//  Created by Berto on 22/1/22.
//

import Foundation
import UIKit

class LoadingManager {
    
    static let shared = LoadingManager()
    var loadingVC:LoadingVC
    
    init() {
        self.loadingVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoadingVC") as! LoadingVC
    }
    
    func show(inView:UIView){
        inView.addSubview(self.loadingVC.view)
    }
    
    func hide(){
        self.loadingVC.view.removeFromSuperview()
    }
}
