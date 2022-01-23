//
//  MarvelBankTests.swift
//  MarvelBankTests
//
//  Created by Berto on 22/1/22.
//

import XCTest
@testable import MarvelBank

class ApiTests: XCTestCase {


    func testSuccessCharacters() throws {

        let expectation = XCTestExpectation()
        
        
        RestService.searchCharacters { charactersReq, error in
            
            XCTAssertNil(error)
            XCTAssertNotNil(charactersReq)
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 5)
        
    }

    func testInvalidOffset() throws {

        let expectation = XCTestExpectation()
        
        RestService.searchCharacters(offset: -10) { charactersReq, error in
            
            XCTAssertNotNil(error)
            if let err = error as? MBError {
                XCTAssertEqual(err.code, 500)
            }else{
                XCTFail("Invalid error")
            }
            XCTAssertNil(charactersReq)
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 5)
        
    }

    func testInvalidLimit() throws {

        let expectation = XCTestExpectation()
        
        RestService.searchCharacters(otherParams:"&limit=1000") { charactersReq, error in
            
            XCTAssertNotNil(error)
            if let err = error as? MBError {
                XCTAssertEqual(err.code, 409)
            }else{
                XCTFail("Invalid error")
            }
            XCTAssertNil(charactersReq)
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 5)
        
    }
    
    
    
}
