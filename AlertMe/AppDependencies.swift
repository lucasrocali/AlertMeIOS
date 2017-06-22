//
//  AppDependencies.swift
//  AlertMe
//
//  Created by Lucas Rocali on 6/12/17.
//  Copyright © 2017 Lucas Rocali. All rights reserved.
//

import Foundation
import UIKit

class AppDependencies {

    var tabBarWireFrame: MainTabBarWireFrame?
    private var rootWireframe: RootWireframe


    // MARK: Public

    init() {
        rootWireframe = RootWireframe()
    }

    func installRootViewControllerIntoWindow(_ window: UIWindow) {
        if let _ = User.sharedInstance.authToken , User.sharedInstance.isLoggedIn {
            tabBarWireFrame = MainTabBarWireFrame()
            tabBarWireFrame!.rootWireframe = rootWireframe
            tabBarWireFrame!.installIntoWindow(window: window)
        } else {
            let introWireframe = LoginWireframe()
            introWireframe.rootWireframe = rootWireframe
            introWireframe.installIntoWindow(window: window)

        }
    }
}
