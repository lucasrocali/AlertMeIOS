//
//  RootWireframe.swift
//  AlertMe
//
//  Created by Lucas Rocali on 6/12/17.
//  Copyright © 2017 Lucas Rocali. All rights reserved.
//

import Foundation
import UIKit

class RootWireframe {

    func showRootViewController(_ viewController: UIViewController, inWindow window: UIWindow) {
        window.rootViewController = viewController
    }

}
