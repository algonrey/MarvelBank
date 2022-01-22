//
//  Character.swift
//  MarvelBank
//
//  Created by Berto on 22/1/22.
//

import Foundation

struct Characters: Decodable {
    
    let offset: Int
    let limit: Int
    let total: Int
    let count: Int
    let results: [Character]
    
}
