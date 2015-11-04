//
//  PopUpAnimator.swift
//  Taparoo
//
//  Created by Tony Albor on 10/26/15.
//  Copyright © 2015 Tony Albor. All rights reserved.
//

import UIKit

class PopUpAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.3
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        guard let sourceVc = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey) as? PopUpSource else {
            return
        }
        
        guard var popUpVc = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey) as? PopUp else {
            return
        }
        
        guard let containerView = transitionContext.containerView() else {
            return
        }
        
        popUpVc.sourceRect = sourceVc.sourceRect
        
        // add pop up view controller's view to container view (where animations are taking place)
        containerView.addSubview(popUpVc.popUpView)
        
        popUpVc.popUpView.alpha = 1
        popUpVc.popUpView.backgroundColor = sourceVc.sourceView?.backgroundColor
        
        // leave a bit of the source vc peeking from the top
        var toFrame = containerView.layer.frame
        toFrame.origin.y = 50
        
        
        for v in popUpVc.popUpView.subviews {
            v.alpha = 0
        }
        
        let sx = sourceVc.sourceRect.width / popUpVc.popUpView.frame.size.width
        let sy = sourceVc.sourceRect.height / popUpVc.popUpView.frame.size.height
        
        popUpVc.popUpView.transform = CGAffineTransformMakeScale(sx, sy)
        popUpVc.popUpView.frame = sourceVc.sourceRect
        
        UIView.animateWithDuration(transitionDuration(transitionContext), animations: {
            
            
            popUpVc.popUpView.transform = CGAffineTransformMakeScale(1,1)
            popUpVc.popUpView.layer.frame = toFrame
            popUpVc.popUpView.layer.cornerRadius = 10
            
            for v in popUpVc.popUpView.subviews {
                v.alpha = 1
            }
            
            }, completion: { (completed: Bool) -> Void in
                popUpVc.popUpView.alpha = 1
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
        })
        
        
    }
}
