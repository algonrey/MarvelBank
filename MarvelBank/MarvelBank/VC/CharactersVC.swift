//
//  ViewController.swift
//  MarvelBank
//
//  Created by Berto on 22/1/22.
//

import UIKit

class CharactersVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var characters = Characters()
        
    override func viewDidAppear(_ animated: Bool) {
             
        LoadingManager.shared.show(inView: self.view)
        RestService.searchCharacters { charactersReq, error in
            
            if error != nil {
                //Error
            }else if let characters = charactersReq?.data {
                self.characters = characters
                self.collectionView.reloadData()
            }
            LoadingManager.shared.hide()
            
        }
    }

}





extension CharactersVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characters.results.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let character = self.characters.results[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CharacterCell", for: indexPath) as! CharacterCell
        
        cell.loadCharacter(character)
        return cell
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: (self.view.frame.size.width / 3) - 10, height: 160)
        
    }
    
}
