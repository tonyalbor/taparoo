//
//  MainMenuViewController.swift
//  Taparoo
//
//  Created by Tony Albor on 10/25/15.
//  Copyright © 2015 Tony Albor. All rights reserved.
//

import UIKit

protocol PopUpSource {
    
    var sourceView: UIView? { get }
    var sourceRect: CGRect { get }
    var presentingView: UIView { get }
}

protocol PopUp {
    
    var sourceRect: CGRect { get set }
    var popUpView: UIView { get }
}

class MainMenuViewController: UIViewController {
    
    var selectedButton: TaparooButton?
    var selectedGameMode: GameMode?
    
    @IBAction func didPressGameModeButton(sender: AnyObject) {
        
        if let sender = sender as? TaparooButton {
            selectedButton = sender
            
            if let g = GameMode(rawValue: sender.titleLabel?.text ?? "") {
                selectedGameMode = g
            }
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let window = UIApplication.sharedApplication().delegate?.window
        window??.rootViewController?.view.backgroundColor = view.backgroundColor
        
        UIApplication.sharedApplication().delegate?.window??.rootViewController?.view.backgroundColor = view.backgroundColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let vc = segue.destinationViewController as? GameLengthViewController {
            vc.gameMode = selectedGameMode
        }
    }

}

extension MainMenuViewController: PopUpSource {
    
    var sourceRect: CGRect {
        return selectedButton != nil ? selectedButton!.frame : CGRect.zero
    }
    
    var presentingView: UIView {
        return view
    }
    
    var sourceView: UIView? {
        return selectedButton
    }
}
