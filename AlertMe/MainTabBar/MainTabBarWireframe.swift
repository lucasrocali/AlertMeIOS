//
// Created by Lucas Rocali
// Copyright (c) 2017 Rocali. All rights reserved.
//

import Foundation
import UIKit

protocol TabBarInterface {
    func configuredViewControllerFromRoot(_ root:MainTabBarWireFrame) -> UIViewController
}

class MainTabBarWireFrame: NSObject {
    var rootWireframe : RootWireframe?
    var wireFrames: [TabBarInterface]!
    var tabBarController : MainTabBarViewController?

    
    //var alertMapWireframe : AlertMapWireframe?

    override init() {
        super.init()

        tabBarController = MainTabBarViewController()

        wireFrames = [TabBarInterface]()
        //        wireFrames(PanelRootWireFrame())
        //alertMapWireframe = AlertMapWireframe()
        wireFrames.append(AlertMapWireframe())
        wireFrames.append(AlertListWireframe())
        wireFrames.append(CreateEventWireframe())

    }

    private class BlankViewController: UIViewController, TabBarInterface {
        func configuredViewControllerFromRoot(_ root:MainTabBarWireFrame) -> UIViewController {
            return self
        }
    }

    func presentMainFromViewController(_ controller: UIViewController!) {

        var viewControllers = [UIViewController]()

        for wireFrame in wireFrames {
            viewControllers.append(wireFrame.configuredViewControllerFromRoot(self))
        }

        tabBarController!.viewControllers = viewControllers

        controller.present(tabBarController!, animated: true, completion: nil)
    }

    func installIntoWindow(window: UIWindow) {

        var viewControllers = [UIViewController]()

        for wireFrame in wireFrames {
            viewControllers.append(wireFrame.configuredViewControllerFromRoot(self))
        }

        tabBarController!.viewControllers = viewControllers

        self.rootWireframe?.showRootViewController(tabBarController!, inWindow: window)
    }

    func logout() {
        if let view = tabBarController! as? UITabBarController {
            view.dismiss(animated: true, completion: nil)
        }
    }
}
