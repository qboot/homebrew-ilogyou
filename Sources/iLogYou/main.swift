//
//  main.swift
//  iLogYou
//
//  Created by Léo LEGRON on 15/01/2019.
//  Copyright © 2019 Léo LEGRON. All rights reserved.
//

import Foundation
import SwiftCodeWriter
import CodeWriter
import XcodeGenKit

var cli = CLI()

cli.welcome()
cli.askForProjectName()
//cli.askForUserModelFields()
//cli.askForAPIAddress()
//cli.askForAPIRoutes()

var fileGenerator = FileGenerator(configuration: cli.configuration)

fileGenerator.generateDirectories()
fileGenerator.generateUserModel()
fileGenerator.generateBasicFiles()
fileGenerator.generateViewControllers()
fileGenerator.generateXcodeProj()

cli.end()

//
// 1. Project Name
// 2. User Model
// 3. API address
// 4. API routes :
//    - login
//    - signup
//    - forgotten password
//    - delete user
//

//
// File architecture of iLogYou Framework
//
// - iLogYou directory
// ---- AppDelegate.swift
// ---- LoginViewController.swift (conditionnal)
// ---- SignUpViewController.swift (conditionnal)
// ---- ProfileViewController.swift (conditionnal)
// ---- DeleteUserViewController.swift (conditionnal)
// ---- PasswordForgottenViewController.swift (conditionnal)
// ---- Assets.xcassets directory
// -------- AppIcon.appiconset
// ------------ AContents.json
// -------- Contents.json
// ---- Base.lproj directory
// -------- LaunchScreen.storyboard
// ---- data directory
// -------- dto directory
// ------------ Services.swift
// ------------ APIProvider.swift
// --------- model directory
// ------------ (Name of user class).swift
// ---- info.plist
//
