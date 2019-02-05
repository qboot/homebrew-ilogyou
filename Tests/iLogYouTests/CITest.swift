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
        XCTAssertNotNil(configuration)
        XCTAssertEqual(configuration.projectName, "")
        XCTAssertEqual(configuration.APIAddress, "")
        XCTAssertEqual(configuration.userClassFields, [:])
        XCTAssertEqual(configuration.APIRoutes, [:])
    }
    
    func testCreateValidAppDelegateFile() {
        let appDelegate = BasicFiles.appDelegate
        XCTAssertTrue(appDelegate.contains("class AppDelegate"))
        XCTAssertTrue(appDelegate.contains("func application("))
        XCTAssertTrue(appDelegate.contains("func applicationWillResignActive"))
        XCTAssertTrue(appDelegate.contains("func applicationDidEnterBackground("))
        XCTAssertTrue(appDelegate.contains("func applicationWillEnterForeground("))
        XCTAssertTrue(appDelegate.contains("func applicationDidBecomeActive("))
        XCTAssertTrue(appDelegate.contains("func applicationWillTerminate("))
    }
    
    func testCreateUserModel() {
        let configuration = Configuration()
        configuration.userClassFields["email"] = "string"
        configuration.userClassFields["password"] = "string"
        configuration.userClassFields["age"] = "int"
        
        let fileConstructor = FileConstructor(configuration: configuration)
        let userModel = fileConstructor.constructUserModel()
        
        XCTAssertTrue(userModel.contains("var age: int?"))
        XCTAssertTrue(userModel.contains("var email: string?"))
        XCTAssertTrue(userModel.contains("var password: string?"))
    }
    
}
