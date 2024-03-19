//
//  NetworkServiceTests.swift
//  SwiftyChallengeTests
//
//  Created by Monish Syed  on 11/08/2020.
//  Copyright © 2020 Monish Syed . All rights reserved.
//

import XCTest
@testable import SwiftyChallenge

class NetworkServiceTests: XCTestCase {
    func test_givenValidResourceExists_dataIsReturned() {
        let service = NetworkService()
        let expectation = self.expectation(description: "resource")
        var resourceData: Data?
        var resourceError: Error?
        let request = MockRequest(url: URL(string: "https://www.google.com")!)
        service.get(request: request) { (result) in
            switch result {
            case .success(let data):
                resourceData = data
            case .failure(let error):
                resourceError = error
            }
            
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 10, handler: nil)
        
        XCTAssertNil(resourceError)
        XCTAssertNotNil(resourceData)
    }
    
    func test_givenInValidResourceExists_errorIsReturned() {
        let service = NetworkService()
        let expectation = self.expectation(description: "resource")
        var resourceData: Data?
        var resourceError: Error?
        let request = MockRequest(url: URL(string: "https://www.blahblah.com")!)
        service.get(request: request) { (result) in
            switch result {
            case .success(let data):
                resourceData = data
            case .failure(let error):
                resourceError = error
            }
            
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 10, handler: nil)
        
        XCTAssertNil(resourceData)
        XCTAssertNotNil(resourceError)
    }
}

private struct MockRequest: CareemRequest {
    var urlRequest: URLRequest {
        return URLRequest(url: url)
    }
    
    var url: URL
}
