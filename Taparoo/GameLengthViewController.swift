//
//  GameLengthViewController.swift
//  Taparoo
//
//  Created by Tony Albor on 10/25/15.
//  Copyright © 2015 Tony Albor. All rights reserved.
//

import UIKit

class GameLengthViewController: UIViewController, PopUp {

    @IBOutlet weak var gameModeLabel: UILabel!
    var gameMode: GameMode?
    var gameLength: GameLength?
    var sourceRect: CGRect = CGRect.zero
    var popUpView: UIView {
        return view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameModeLabel.text = gameMode?.rawValue
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nice(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
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
