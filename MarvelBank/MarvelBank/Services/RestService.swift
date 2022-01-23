//
//  RestService.swift
//  MarvelBank
//
//  Created by Berto on 22/1/22.
//

import Foundation
import Alamofire


class RestService {
    
    
    /// Retrive the list of character for a given options
    /// - Parameters:
    ///   - offset: The offset of the search
    ///   - otherParams: Any other params to be added to the URL (used in the Unit Tests)
    ///   - completion: The completion params, CharactersRequest and Error
    static func searchCharacters(offset:Int = 0, otherParams:String? = nil, completion:@escaping((CharactersRequest?, Error?)->Void))  {
        
        var url = Constants.URLs.characters
        if offset != 0 {
            url = "\(url)&offset=\(offset)"
        }
        if let op = otherParams {
            url = "\(url)\(op)"
        }
        let request = AF.request(url)
        request.responseDecodable(of: CharactersRequest.self) { (response) in
            
            print("Requesting \(String(describing: response.request?.url))")

            if let error = self.searchForError(response) {
                completion(nil,error)
            }else if let charactersReq = response.value{
                completion(charactersReq,nil)
            }else{
                completion(nil, MBError(code: 404, description: MBError.errorDescription(404)))
            }
        }
        
    }
    
    
    /// Retrive the list of character for a given options
    /// - Parameters:
    ///   - id: The id of the character
    ///   - otherParams: Any other params to be added to the URL (used in the Unit Tests)
    ///   - completion: The completion params, CharactersRequest and Error
    static func searchCharacter(id:Int, completion:@escaping((CharactersRequest?, Error?)->Void))  {
        
        let url = Constants.URLs.character(id: id)
        let request = AF.request(url)
        request.responseDecodable(of: CharactersRequest.self) { (response) in
            
            print("Requesting \(String(describing: response.request?.url))")

            if let error = self.searchForError(response) {
                completion(nil,error)
            }else if let charactersReq = response.value{
                completion(charactersReq,nil)
            }else{
                completion(nil, MBError(code: 404, description: MBError.errorDescription(404)))
            }
        }
        
    }
    
    
    private static func searchForError(_ response:DataResponse<CharactersRequest, AFError>) -> Error? {
        
        if let statusCode = response.response?.statusCode, statusCode != 200 {
            //There is an error in the response status code
            return MBError(code: statusCode, description: MBError.errorDescription(statusCode))
        }else if let error = response.error {
            //There is an error obj in the response
            return error
        }else if response.value == nil {
            //The response has no data
            return MBError(code: 404, description: MBError.errorDescription(404))
        }
        
        //There is no error
        return nil
        
    }
    
    
}
