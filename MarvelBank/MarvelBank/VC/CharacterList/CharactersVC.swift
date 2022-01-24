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
    private let refreshControl = UIRefreshControl()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Initial retrieval of the characters
        self.retriveCharacters()
        
        //Refresh controller configuration
        refreshControl.addTarget(self, action: #selector(refresh(_:)), for: .valueChanged)
        refreshControl.tintColor = UIColor.white
        collectionView.alwaysBounceVertical = true
        collectionView.refreshControl = refreshControl
    }
    
    /// Retrive the characters from the cloud.
    private func retriveCharacters(){

        LoadingManager.shared.show(inView: self.view)

        //The next elements are the current offset plus the limit used in the last call
        let offset = self.characters.offset + self.characters.limit
        RestService.searchCharacters(offset: offset) { charactersReq, error in
            
            if error != nil {
                AlertManager.showErrorAlert(message: error!.localizedDescription, in: self)
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
            self.refreshControl.endRefreshing()
        }

    }
    
    @objc
    private func refresh(_ sender: Any) {

        self.characters.offset = 0
        self.characters.limit = 0
        self.characters.results.removeAll()
        self.collectionView.reloadData()
        self.retriveCharacters()
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let vc = segue.destination as? CharacterDetailVC, let char = sender as? Character {
            vc.character = char
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let character = self.characters.results[indexPath.row]
        
        LoadingManager.shared.show(inView: self.view)
        
        //Download the character information and send it to the other view.
        RestService.searchCharacter(id: character.id) { charReq, error in
            
            LoadingManager.shared.hide()
            if error != nil {
                AlertManager.showErrorAlert(message: error!.localizedDescription, in: self)
            }else if let characters = charReq?.data, let char = characters.results.first {
                self.performSegue(withIdentifier: Constants.Segues.CharacterDetail, sender: char)
            }
        }
        
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: (self.view.frame.size.width / 3) - 10, height: 160)
        
    }
    
}
