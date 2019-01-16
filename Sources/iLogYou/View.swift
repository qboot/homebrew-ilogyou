//
//  View.swift
//  CodeWriter
//
//  Created by Léo LEGRON on 15/01/2019.
//

import Foundation

class View {
    
    public func welcome(){
        print()
        print("✨  Hi, welcome to iLogYou ! ✨\n")
    }
    
    public func askForProjectName(){
        print("What's your project name ?")
    }
    
    public func askForUserModelName(){
        print("Name of user class :")
    }
    
    public func askForUserModelFields(){
        print("What fields do you need ?")
    }
    
    public func askForFieldName(){
        print("Field Name :")
    }
    
    public func askForFieldType(){
        print("Field Type : (String, Int, Double, ...)")
    }
    
    public func askToKeepGoing(){
        print("Keep going ? Yes / No")
    }
    
    public func askForViews(){
        print("What views do you need to implement in your app : (ex: 1,2,5)")
    }
    
    public func askForAPIAddress(){
        print("What's your API address ? (ip or domain name)")
    }
    
    public func askForAPIRoutes(){
        print("What are your API routes ? (ex: /login)")
    }
    
    public func askForRoute(view: String, method: String){
        print("\(view) -> \(method) method :")
    }
    
}
