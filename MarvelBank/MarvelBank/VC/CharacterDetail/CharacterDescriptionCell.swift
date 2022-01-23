//
//  CharacterDescriptionCell.swift
//  MarvelBank
//
//  Created by Berto on 23/1/22.
//

import Foundation
import UIKit

class CharacterDescriptionCell:UITableViewCell {


    @IBOutlet weak var characterName: UILabel!
    @IBOutlet weak var characterDescription: UILabel!

    @IBOutlet weak var comicsCount: UILabel!
    @IBOutlet weak var eventsCount: UILabel!
    @IBOutlet weak var seriesCount: UILabel!
    @IBOutlet weak var storiesCount: UILabel!
    
    
    func loadCharacter(_ ch:Character) {
        
        self.characterName.text = ch.name
        if !ch.description.isEmpty {
            self.characterDescription.text = ch.description
        }else{
            self.characterDescription.text = "No description available."
        }
        
        self.comicsCount.text = "\(ch.comics.available)"
        self.eventsCount.text = "\(ch.events.available)"
        self.seriesCount.text = "\(ch.series.available)"
        self.storiesCount.text = "\(ch.stories.available)"
        
        
    }
    
}
