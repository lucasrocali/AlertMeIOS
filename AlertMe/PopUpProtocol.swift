//
//  PopUpProtocol.swift
//  ViperDemoProject
//
//  Created by Lucas Rocali on 5/10/17.
//  Copyright © 2017 Lucas Rocali. All rights reserved.
//

import Foundation
import UIKit

enum PopUpType {
    case center
    case bottom
}

struct PopUpInfo {
    var popUpView : UIView
    var transitioningBackgroundView: UIView
    var backgroundAlpha: Float
    var popupType : PopUpType
}

protocol PopUpProtocol: class
{
    var popUpInfo : PopUpInfo? { get set }
    func didTapBackgroundView(_ sender:UITapGestureRecognizer)
}
