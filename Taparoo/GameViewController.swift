//
//  GameViewController.swift
//  Taparoo
//
//  Created by Tony Albor on 11/3/15.
//  Copyright © 2015 Tony Albor. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var timeLeftLabel: UILabel!
    var game: Game?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let game = game {
            timeLeftLabel.text = ":\(game.timeLeft)"
        }
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
    
    @IBAction func didPressPauseButton(sender: TaparooButton) {
        
        if let game = game {
            
            if game.isPaused && game.resume() {
                // game is now resumed
                sender.setTitle("Pause", forState: .Normal)
            } else if !game.isPaused && game.pause() {
                // game is now paused
                sender.setTitle("Play", forState: .Normal)
            }
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
