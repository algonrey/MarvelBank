//
//  Character.swift
//  MarvelBank
//
//  Created by Berto on 22/1/22.
//

import Foundation

struct Character: Decodable {
    
    let id: Int
    let name: String
    let description: String
    struct thumbnail{
        let path: String
    }
    
    
    
}
