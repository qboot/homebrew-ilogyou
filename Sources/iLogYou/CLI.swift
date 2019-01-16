//
//  CLI.swift
//  CodeWriter
//
//  Created by Léo LEGRON on 15/01/2019.
//

import Foundation

class CLI {
    
    var configuration = Configuration()
    var view = View()
    
    public func welcome(){
        view.welcome()
    }
    
    public func askForProjectName(){
        view.askForProjectName()
        if let input = readLine(){
            configuration.projectName = input
        }
    }
    
    public func askForUserModelName(){
        view.askForUserModelName()
        if let input = readLine() {
            configuration.userClassName = input
        }
    }
    
    public func askForUserModelFields(){
        view.askForUserModelFields()
        var askForFields = true
        while(askForFields){
            let fieldName = self.askForFieldName()
            let fieldType = self.askForFieldType()
            configuration.userClassFields[fieldName] = fieldType
            askForFields = self.keepGoing()
        }
    }
    
    public func askForFieldName() -> String {
        view.askForFieldName()
        if let input = readLine() {
            return input
        } else {
            return ""
        }
    }
    
    public func askForFieldType() -> String {
        view.askForFieldType()
        if let input = readLine() {
            return input
        } else {
            return ""
        }
    }
    
    public func keepGoing() -> Bool {
        view.askToKeepGoing()
        if let input = readLine() {
            if(input == "No"){
                return false
            }
        }
        return true
    }
    
    public func askForViews(){
        view.askForViews()
        var i = 1
        configuration.viewsAvailable.forEach { (key: String, value: String) in
            print("\(i) - \(key) -> \(value) method")
            i += 1
        }
        if let input = readLine() {
            let inputArray = input.split(separator: ",")
            inputArray.forEach { element in
                if var number = Int(element) {
                    number -= 1
                    var i = 0
                    configuration.viewsAvailable.forEach({ (key: String, value: String) in
                        if(number == i){
                            configuration.viewsNeeded[key] = value;
                        }
                        i += 1
                    })
                }
            }
        }
    }
    
    public func askForAPIAddress(){
        view.askForAPIAddress()
        if let input = readLine() {
            configuration.APIAddress = input
        }
    }
    
    public func askForAPIRoutes(){
        view.askForAPIRoutes()
        
        configuration.viewsNeeded.forEach({ (key: String, value: String) in
            view.askForRoute(view: key, method: value)
            if let input = readLine(){
                configuration.APIRoutes[input] = value
            }
        })
    }
}
