//
//  Configuration.swift
//  CodeWriter
//
//  Created by Léo LEGRON on 15/01/2019.
//

import Foundation

class Configuration {
    
    public var projectName = ""
    public var userClassName = ""
    public var userClassFields = [String:String]()
    public var APIAddress = ""
    public var APIRoutes = [String: String]()
    public var viewsNeeded = [String: String]()
    public var viewsAvailable = [
        "Login": "POST",
        "SignUp": "POST",
        "Profile": "GET",
        "Password forgotten": "POST",
        "Delete User": "DELETE"
    ]
    
}
