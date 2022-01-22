//
//  ViewController.swift
//  MarvelBank
//
//  Created by Berto on 22/1/22.
//

import UIKit

class CharactersVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
             
        LoadingManager.shared.show(inView: self.view)
        RestService.searchCharacters { characters, error in
            
            LoadingManager.shared.hide()
            
            
        }
    }


}
