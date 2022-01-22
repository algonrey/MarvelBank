//
//  RestService.swift
//  MarvelBank
//
//  Created by Berto on 22/1/22.
//

import Foundation
import Alamofire


class RestService {
    
    
    static func searchCharacters(completion:@escaping((CharactersRequest?, Error?)->Void))  {
        
        let request = AF.request(Constants.URLs.characters())
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
