//
//  ViewController.swift
//  MarvelBank
//
//  Created by Berto on 22/1/22.
//

import UIKit

class CharactersVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var copyright: UILabel!
    
    var characters = Characters()
        
    override func viewDidAppear(_ animated: Bool) {
             
        self.retriveCharacters()
    }
    
    
    /// Retrive the characters from the cloud.
    private func retriveCharacters(){

        LoadingManager.shared.show(inView: self.view)

        let offset = self.characters.offset + self.characters.limit
        RestService.searchCharacters(offset: offset) { charactersReq, error in
            
            if error != nil {
                //Error
            }else if let characters = charactersReq?.data {
                self.characters.total = characters.total
                self.characters.offset = characters.offset
                self.characters.limit = characters.limit
                self.characters.count = characters.count
                self.characters.results.append(contentsOf: characters.results)
                
                self.collectionView.reloadData()
                self.copyright.text = charactersReq?.copyright
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
        
        //Check when we reach the last element (to load more if neccesary)
        if self.characters.total != self.characters.results.count &&
            indexPath.row + 1 == self.characters.results.count {
            
            self.retriveCharacters()
            
        }
        
        return cell
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: (self.view.frame.size.width / 3) - 10, height: 160)
        
    }
    
}
