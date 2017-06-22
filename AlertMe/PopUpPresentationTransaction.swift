//
//  PopUpPresentationTransaction.swift
//  ViperDemoProject
//
//  Created by Lucas Rocali on 5/10/17.
//  Copyright © 2017 Lucas Rocali. All rights reserved.
//

import Foundation
import UIKit

class PopUpPresentationTransaction: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.72
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)!
        let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) as! PopUpProtocol


        toVC.popUpInfo?.transitioningBackgroundView.backgroundColor = UIColor(colorLiteralRed: 77.0/255.0, green: 77.0/255.0, blue: 77.0/255.0, alpha: (toVC.popUpInfo?.backgroundAlpha)!)
        toVC.popUpInfo?.transitioningBackgroundView.frame = UIScreen.main.bounds

        let containerView = transitionContext.containerView

        containerView.addSubview((toVC.popUpInfo?.transitioningBackgroundView)!)
        containerView.addSubview((toVC.popUpInfo?.popUpView)!)

        let toViewFrame = CGRect(x: 0, y: 0, width: (toVC.popUpInfo?.popUpView.bounds.size.width)!, height: (toVC.popUpInfo?.popUpView.bounds.size.height)!)
        toVC.popUpInfo?.popUpView.frame = toViewFrame

        var finalCenter = CGPoint(x: fromVC.view.bounds.size.width / 2, y: (fromVC.view.bounds.size.height - toViewFrame.size.height) + toViewFrame.size.height / 2)

        if toVC.popUpInfo?.popupType == PopUpType.center {
            finalCenter = CGPoint(x: fromVC.view.bounds.size.width / 2, y: fromVC.view.bounds.size.height / 2)
        }
        toVC.popUpInfo?.popUpView.center = CGPoint(x: finalCenter.x, y: finalCenter.y + 200.0)

        let options = UIViewAnimationOptions.curveEaseIn

        UIView.animate(withDuration: self.transitionDuration(using: transitionContext),
                       delay: 0.0,
                       usingSpringWithDamping: 0.64,
                       initialSpringVelocity: 0.22,
                       options: options,
                       animations: {
                        toVC.popUpInfo?.popUpView.center = finalCenter
                        toVC.popUpInfo?.transitioningBackgroundView.alpha = 0.7
        },
                       completion: { finished in
                        toVC.popUpInfo?.popUpView.center = finalCenter
                        transitionContext.completeTransition(true)
        }
        )
    }
    
}
