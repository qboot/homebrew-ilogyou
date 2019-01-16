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

var cli = CLI()

cli.welcome()
cli.askForProjectName()
cli.askForUserModelName()
cli.askForUserModelFields()
cli.askForViews()
cli.askForAPIAddress()
cli.askForAPIRoutes()

var fileGenerator = FileGenerator(configuration: cli.configuration)

fileGenerator.generateDirectories()
fileGenerator.generateUserModel()

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
