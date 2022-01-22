//
//  RestService.swift
//  MarvelBank
//
//  Created by Berto on 22/1/22.
//

import Foundation
import Alamofire


class RestService {
    
    
    static func searchCharacters(offset:Int = 0, completion:@escaping((CharactersRequest?, Error?)->Void))  {
        
        var url = Constants.URLs.characters()
        if offset != 0 {
            url = "\(url)&offset=\(offset)"
        }
        let request = AF.request(url)
        request.responseDecodable(of: CharactersRequest.self) { (response) in
            print("Requesting \(String(describing: response.request?.url))")

            guard let charactersReq = response.value else {
                completion(nil,response.error)
                return
            }
            completion(charactersReq, nil)
        }
        
        
    }
    
    
    
}
