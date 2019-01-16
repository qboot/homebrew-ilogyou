//
//  FileGenerator.swift
//  CodeWriter
//
//  Created by Léo LEGRON on 16/01/2019.
//

import Foundation
import SwiftCodeWriter

class FileGenerator {
    
    var configuration: Configuration
    
    init(configuration: Configuration){
        self.configuration = configuration
    }
    
    public func generateDirectories(){
        do {
            try FileManager.default.createDirectory(atPath: configuration.projectName, withIntermediateDirectories: false, attributes: nil)
            try FileManager.default.createDirectory(atPath: "\(configuration.projectName)/data", withIntermediateDirectories: false, attributes: nil)
            try FileManager.default.createDirectory(atPath: "\(configuration.projectName)/data/dto", withIntermediateDirectories: false, attributes: nil)
            try FileManager.default.createDirectory(atPath: "\(configuration.projectName)/data/model", withIntermediateDirectories: false, attributes: nil)
        } catch let error as NSError {
            print(error.localizedDescription);
        }
    }
    
    public func generateUserModel(){
        var fileDescription = FileDescription()
        var cd = ClassDescription(name: self.configuration.userClassName, options: .init(visibility: .default, isReferenceType: true))
        self.configuration.userClassFields.forEach { (name: String, type: String) in
            cd.properties.append(.init(name: name, type: type))
        }
        fileDescription.classes.append(cd)
        let userModel = FileWriter.default.write(description: fileDescription)
        do {
            try userModel.write(toFile: "\(configuration.projectName)/data/model/\(self.configuration.userClassName).swift", atomically: false, encoding: String.Encoding.utf8)
        }
        catch let error as NSError {
            print("\(error)")
        }
    }
    
    public func generateViewControllers(){
        
    }
    
    
    
}
