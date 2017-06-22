//
//  AppDelegate.swift
//  AlertMe
//
//  Created by Lucas Rocali on 6/12/17.
//  Copyright © 2017 Lucas Rocali. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var loginWireframe : LoginWireframe?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        login()
        return true
    }

    func login() {
        let appDependencies = AppDependencies()
        appDependencies.installRootViewControllerIntoWindow(window!)
    }



}

