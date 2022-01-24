//
//  AlertManager.swift
//  MarvelBank
//
//  Created by Berto on 23/1/22.
//

import Foundation
import UIKit

class AlertManager {
    
    static func showErrorAlert(message:String, in view:UIViewController) {
        
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        view.present(alert, animated: true, completion: nil)
        
    }
    
    
}
