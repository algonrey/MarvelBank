//
//  Constans.swift
//  MarvelBank
//
//  Created by Berto on 22/1/22.
//


import Foundation

struct Constants {
    
    static let PUBLIC_KEY = "17b4bf531c91fb84523da228f8874020"
    static let PRIVATE_KEY = "a04bbcc12bcac3cb1366c5da24252e6c7e8a5c70"
    static func hash(ts:String)-> String {
        if let hashData = "\(ts)\(Constants.PRIVATE_KEY)\(Constants.PUBLIC_KEY)".data(using: .utf8) {
            return hashData.md5
        }
        return "INVALID_HASH"
    }
    struct URLs {
        static let endpoint = "https://gateway.marvel.com:443/v1/public"
        static func hashParams() -> String{
            let ts = "\(Date.timeIntervalSinceReferenceDate)"
            return "&ts=\(ts)&hash=\(Constants.hash(ts: ts))"
        }
        static let characters = "\(Constants.URLs.endpoint)/characters?apikey=\(Constants.PUBLIC_KEY)\(Constants.URLs.hashParams())"
        
        static func character(id:Int) -> String{
            return "\(Constants.URLs.endpoint)/characters/\(id)?apikey=\(Constants.PUBLIC_KEY)\(Constants.URLs.hashParams())"
        }
    }
    
    struct Segues {
        static let CharacterDetail = "CharacterDetailVC"
    }
}
