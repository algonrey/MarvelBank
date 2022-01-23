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
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterImageCell", for: indexPath) as! CharacterImageCell

            if let path = self.character?.thumbnail.fullUrl {
                cell.characterImage.kf.setImage(with: URL(string: path))
            }
            
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterDescriptionCell", for: indexPath) as! CharacterDescriptionCell
            
            cell.characterDescription.text = self.character?.description
            cell.characterName.text = self.character?.name
            
            return cell
        
        default:
            return UITableViewCell()
        }
    
    }
    
    
    
    
}
