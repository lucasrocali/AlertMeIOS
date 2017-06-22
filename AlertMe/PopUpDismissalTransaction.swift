//
//  PopUpDismissalTransaction.swift
//  ViperDemoProject
//
//  Created by Lucas Rocali on 5/10/17.
//  Copyright © 2017 Lucas Rocali. All rights reserved.
//

import Foundation
import UIKit

class PopUpDismissalTransaction : NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.72
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from) as! PopUpProtocol
        let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)!

        let finalCenter = CGPoint(x: toVC.view.bounds.size.width/2, y: (fromVC.popUpInfo?.popUpView.bounds.size.height)! + 600)

        let options = UIViewAnimationOptions.curveEaseIn

        UIView.animate(withDuration: self.transitionDuration(using: transitionContext),
                       delay: 0.0,
                       usingSpringWithDamping: 0.64,
                       initialSpringVelocity: 0.22,
                       options: options,
                       animations: {
                        fromVC.popUpInfo?.popUpView.center = finalCenter
                        fromVC.popUpInfo?.transitioningBackgroundView.alpha = 0.0
        },
                       completion: { finished in
                        fromVC.popUpInfo?.popUpView.removeFromSuperview()
                        transitionContext.completeTransition(true)
        }
        )
    }
    
}
