//
//  UtilsTest.swift
//  MarvelBankTests
//
//  Created by Berto on 22/1/22.
//

import Foundation
import XCTest
@testable import MarvelBank

class UtilsTests: XCTestCase {


    func testMd5(){
        
        XCTAssertEqual("makemymd5".data(using: .utf8)?.md5, "f8d010165548508e1dd54b137ef735af")
        XCTAssertNotEqual("makemymd5".data(using: .utf8)?.md5, "f8d010165548508e1dd54b137ef735ad")

    }

}

