//
//  CharacterCell.swift
//  MarvelBank
//
//  Created by Berto on 22/1/22.
//

import Foundation
import UIKit
import Kingfisher

class CharacterCell: UICollectionViewCell {
    
    
    @IBOutlet weak var loading: UIActivityIndicatorView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var thumbnail: UIImageView!
 
    override func layoutSubviews() {
        self.thumbnail.layer.cornerRadius = thumbnail.frame.size.width / 2
        self.thumbnail.layer.borderColor = UIColor.white.cgColor
        self.thumbnail.layer.borderWidth = 1
    }
    
    func loadCharacter(_ ch:Character) {
        
        self.name.text = ch.name
        if ch.thumbnail.fullUrl.contains("image_not_available") {
            self.thumbnail.image = UIImage(named: "hydra")
            self.loading.stopAnimating()
        }else{
            self.loading.startAnimating()
            self.thumbnail.kf.setImage(with: URL(string: ch.thumbnail.fullUrl)) { result in
                self.loading.stopAnimating()
            }
        }
        
    }

    
}
