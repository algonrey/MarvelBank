//
//  MBError.swift
//  MarvelBank
//
//  Created by Berto on 22/1/22.
//

import Foundation

struct MBError : Error {
    
    var code:Int
    var description:String
    
    
    static func errorDescription(_ errorCode:Int) -> String {
        
        switch errorCode {
        case 404:
            return "Not data received from the server"
        case 409:
            return "Some params requested are invalid"
        case 500:
            return "Internal Server Error, please try again later"
        default:
            return "Unknown error"
        }
        
        
    }
}
