//
//  CharactersRequest.swift
//  MarvelBank
//
//  Created by Berto on 22/1/22.
//

import Foundation

/// Character request model to match the api
struct CharactersRequest: Decodable {
    
    let code: Int
    let status: String
    let copyright: String
    let data: Characters
    
}
