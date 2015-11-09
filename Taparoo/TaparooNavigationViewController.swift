//
//  TaparooNavigationViewController.swift
//  Taparoo
//
//  Created by Tony Albor on 10/25/15.
//  Copyright © 2015 Tony Albor. All rights reserved.
//

import UIKit

class TaparooNavigationViewController: UINavigationController, UINavigationControllerDelegate {
    
    var popUpAnimator: PopUpAnimator
    var popDownAnimator: PopDownAnimator
    var interactionController: UIPercentDrivenInteractiveTransition?
    
    required init?(coder aDecoder: NSCoder) {
        popUpAnimator = PopUpAnimator()
        popDownAnimator = PopDownAnimator()
        super.init(coder: aDecoder)
        
        // needs work
//        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: "didPan:")
//        view.addGestureRecognizer(panGestureRecognizer)
    }
    
    func didPan(gestureRecognizer: UIPanGestureRecognizer) {
        print("nice")
        switch(gestureRecognizer.state) {
            
        case .Began:
            interactionController = UIPercentDrivenInteractiveTransition()
//            let location = gestureRecognizer.locationInView(view)
//            if location.x < CGRectGetMidX(view.bounds) && viewControllers.count > 1 {
//                interactionController = UIPercentDrivenInteractiveTransition()
//                popViewControllerAnimated(true)
//            }
            break
            
        case .Changed:
            let translation = gestureRecognizer.translationInView(view)
            let d = fabs(translation.y / CGRectGetHeight(view.bounds))
//            topViewController?.view.frame.origin.x += translation.x
            topViewController?.view.frame.origin.y = translation.y + 50
            interactionController?.updateInteractiveTransition(d)
            break
            
        case .Ended:
            if gestureRecognizer.velocityInView(view).x > 0 {
                print("finish")
                popViewControllerAnimated(true)
                interactionController?.finishInteractiveTransition()
            } else {
                print("cancel: \(gestureRecognizer.velocityInView(view).x)")
                interactionController?.cancelInteractiveTransition()
                
                // TODO :: animate back in place
                let duration: NSTimeInterval = 0.5
                UIView.animateWithDuration(duration, animations: {
                self.topViewController?.view.frame.origin.y = 50
                })
                
            }
            interactionController = nil
            break
            
        default:
            break
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        navigationBar.hidden = true

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        switch(operation) {
            
        case .Push:
            if toVC.isKindOfClass(GameLengthViewController) {
                return popUpAnimator
            } else if toVC.isKindOfClass(GameViewController) {
                return popDownAnimator
            }
            break
            
        case .Pop:
            return popDownAnimator
            
        default:
            return nil
        }
        
        return nil
    }
    
    func navigationController(navigationController: UINavigationController, interactionControllerForAnimationController animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        
        return interactionController
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
