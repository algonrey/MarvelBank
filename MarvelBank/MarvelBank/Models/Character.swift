//
//  Character.swift
//  MarvelBank
//
//  Created by Berto on 22/1/22.
//

import Foundation

/// Character Model to match the api
struct Character: Decodable {
    
    let id: Int
    let name: String
    let description: String
    let thumbnail:Thumbnail
    
    struct Thumbnail: Decodable{
        let path: String
        let ext: String
        enum CodingKeys: String, CodingKey {
            case path
            case ext = "extension"
        }
        var fullUrl:String {
            return "\(self.path).\(self.ext)"
        }
    }
    
    
    
    
}
