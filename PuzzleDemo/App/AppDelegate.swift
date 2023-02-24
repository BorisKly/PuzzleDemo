//
//  AppDelegate.swift
//  PuzzleDemo
//
//  Created by Boris Klykavka on 24.02.2023.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: -
    // MARK: Properties

    var window: UIWindow?
    var appConfigurator: AppConfigurator?
    
    // MARK: -
    // MARK: Methods
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let windowL = UIWindow(frame: UIScreen.main.bounds)
        self.window = windowL
        self.appConfigurator = AppConfigurator(window: windowL)
        return true
    }
}
