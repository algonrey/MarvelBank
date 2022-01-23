//
//  CharacterDetailVC.swift
//  MarvelBank
//
//  Created by Berto on 23/1/22.
//

import Foundation
import UIKit

class CharacterDetailVC:UIViewController {
    
    @IBOutlet weak var tableview: UITableView!
    
    var character:Character?
    
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
}


extension CharacterDetailVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        //The imagen and the character description
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        switch indexPath.section {
        case 0:
            //The imagen cell
            let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterImageCell", for: indexPath) as! CharacterImageCell

            if let path = self.character?.thumbnail.fullUrl {
                cell.characterImage.kf.setImage(with: URL(string: path))
            }
            
            return cell
        default:
            //the character description cell
            let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterDescriptionCell", for: indexPath) as! CharacterDescriptionCell
            if let ch = self.character {
                cell.loadCharacter(ch)
            }
            return cell
        }
    
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0 {
            //Set the height for the image
            return 250
        }else{
            return UITableView.automaticDimension
        }
        
    }
    
}
