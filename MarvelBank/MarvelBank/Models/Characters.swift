//
//  Character.swift
//  MarvelBank
//
//  Created by Berto on 22/1/22.
//

import Foundation

/// Characters Model to match the api
struct Characters: Decodable {
    
    let offset: Int
    let limit: Int
    let total: Int
    let count: Int
    let results: [Character]
    
    
    /// Custom initializacion with 0 information, e.g to not show nothing in the main view (initialization of the view)
    init() {
        offset = 0
        limit = 0
        total = 0
        count = 0
        results = []
    }
}
