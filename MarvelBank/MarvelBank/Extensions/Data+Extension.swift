//
//  Data+Extension.swift
//  MarvelBank
//
//  Created by Berto on 22/1/22.
//

import Foundation
import CryptoKit

extension Data {
    
    var md5: String {
        Insecure.MD5
            .hash(data: self)
            .map {String(format: "%02x", $0)}
            .joined()
    }
    
}
