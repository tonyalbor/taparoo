//
//  GameViewController.swift
//  Taparoo
//
//  Created by Tony Albor on 11/3/15.
//  Copyright © 2015 Tony Albor. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    var game: Game?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func start() {
        
        if let game = game {
            game.start()
        }
    }
    
    func restart() {
        
        if let game = game {
            game.restart()
        }
    }
    
    func setUpNextButtonStateOrSomeShit() {
        // 
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
