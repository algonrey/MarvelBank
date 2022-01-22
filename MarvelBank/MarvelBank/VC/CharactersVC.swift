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
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoadingVC")
     
        self.view.addSubview(vc.view)
        RestService.searchCharacters { characters, error in
            
            
            
        }
    }


}
