//
//  PopDownAnimator.swift
//  Taparoo
//
//  Created by Tony Albor on 10/26/15.
//  Copyright © 2015 Tony Albor. All rights reserved.
//

import UIKit

class PopDownAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.3
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        guard let popUpVc = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey) as? PopUp else {
            return
        }
        
        guard let sourceVc = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey) else {
            return
        }
        
        guard let containerView = transitionContext.containerView() else {
            return
        }
        
        // add source view controller's view to container view (where animations are taking place)
        containerView.insertSubview(sourceVc.view, belowSubview: popUpVc.popUpView)
        sourceVc.view.alpha = 1
        
        let toFrame = popUpVc.sourceRect
        let sx = toFrame.width / popUpVc.popUpView.frame.size.width
        let sy = toFrame.height / popUpVc.popUpView.frame.size.height
        
        UIView.animateWithDuration(transitionDuration(transitionContext), animations: {
            
            popUpVc.popUpView.transform = CGAffineTransformMakeScale(sx, sy)
            popUpVc.popUpView.frame = toFrame
            for v in popUpVc.popUpView.subviews {
                v.alpha = 0
            }
            
            }, completion: { (completed: Bool) -> Void in
                
                sourceVc.view.alpha = 1
                popUpVc.popUpView.alpha = 0
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
        })
        
    }
}
