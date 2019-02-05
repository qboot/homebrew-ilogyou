//
//  CITest.swift
//  iLogYouTests
//
//  Created by pierre piron on 05/02/2019.
//

import XCTest
@testable import iLogYou

class CITest: XCTestCase {
    
    func testBlankConfiguration() {
        
        let configuration = Configuration()
        print(configuration.userClassFields)
        XCTAssertEqual(configuration.projectName, "")
        XCTAssertEqual(configuration.APIAddress, "")
        XCTAssertEqual(configuration.userClassFields, [:])
        XCTAssertEqual(configuration.APIRoutes, [:])
    }
    
    
}
