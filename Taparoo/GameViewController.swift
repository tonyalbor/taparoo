//
//  GameViewController.swift
//  Taparoo
//
//  Created by Tony Albor on 11/3/15.
//  Copyright © 2015 Tony Albor. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, GameDelegate {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var timeLeftLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var buttonOne: TaparooButton!
    @IBOutlet weak var buttonTwo: TaparooButton!
    @IBOutlet weak var buttonThree: TaparooButton!
    @IBOutlet weak var buttonFour: TaparooButton!
    
    // MARK: - Variables
    
    var previousN: UInt32?
    var selectedButton: TaparooButton?
    var game: Game?
    
    // MARK: - GameDelegate
    
    func timerUpdated() {
        updateTimerLabel()
    }
    
    func timerEnded() {
        updateTimerLabel()
        didChangeGame()
    }
    
    // MARK: - UIViewControlller

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let game = game {
            timeLeftLabel.text = ":\(game.timeLeft)"
            scoreLabel.hidden = game.score == 0
            game.gameDelegate = self
        }
        
        buttonOne.number = 1
        buttonTwo.number = 2
        buttonThree.number = 3
        buttonFour.number = 4
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - IBAction
    
    @IBAction func didPressPauseButton(sender: TaparooButton) {
        
        guard let game = game else {
            return
        }
        
        switch (game.state) {
            
        case .Active:
            if game.canPause {
                game.pause()
                sender.setTitle("Pause", forState: .Normal)
            }
            
        case .Paused:
            game.resume()
            sender.setTitle("Resume", forState: .Normal)
            
        default:
            return
            
        }
    }
    
    @IBAction func didPressRestartButton(sender: AnyObject) {
        game?.restart()
        didChangeGame()
    }
    
    @IBAction func didPressMainMenuButton(sender: AnyObject) {
        navigationController?.popToRootViewControllerAnimated(false)
    }
    
    @IBAction func tappedIt(sender: TaparooButton) {
        
        guard let game = game else {
            return
        }
        
        selectedButton = sender
        
        switch (game.state) {
            
        case .Waiting:
            game.start()
            fallthrough
            
        case .Active:
            game.hitButton(sender)
            didChangeGame()
            
        default:
            return
        }
    }
    
    // MARK: - Helper
    
    func updateTimerLabel() {
        if let game = game {
            timeLeftLabel.text = String(format: ":%.1f", game.timeLeft)
        }
    }
    
    func didChangeGame() {
        
        guard let game = game else {
            return
        }
        
        switch (game.state) {
            
        case .Waiting:
            restart()
            scoreLabel.hidden = true
            
        case .Active:
            updateScoreLabel()
            scoreLabel.hidden = false
            determineNextButtonState()
            
        case .GameOver:
            gameOver()
            
        default:
            break
        }
    }
    
    // MARK: - Buttons
    
    func determineNextButtonState() {
        
        guard let game = game else {
            return
        }
        
        switch (game.mode) {
            
        case .Classic:
            fallthrough
            
        case .Endure:
            fallthrough
            
        case .Scatter:
            setNextTapItButtons()
            
        case .Taparoo:
            setTaparooModeButtons()
            
        }
    }
    
    func updateScoreLabel() {
        scoreLabel.text = "\(game?.score ?? 0)"
    }
    
    func buttonForN(n: UInt32) -> TaparooButton {
        switch (n) {
            
        case 1:
            return buttonOne
            
        case 2:
            return buttonTwo
            
        case 3:
            return buttonThree
            
        case 4:
            return buttonFour
            
        default:
            // oh i sure hope not
            break
        }
        
        return buttonFour
    }
    
    
    
    func setTaparooModeButtons() {
        chooseNextTaparooButtons()
    }
    
    // MARK: - Update Buttons
    
    func restart() {
        
        buttonOne.setTapIt()
        buttonTwo.setTapIt()
        buttonThree.setTapIt()
        buttonFour.setTapIt()
    }
    
    // update button titles
    func gameOver() {
        buttonOne.gameOver()
        buttonTwo.gameOver()
        buttonThree.gameOver()
        buttonFour.gameOver()
    }
    
    // determine which button should be next Tap It!
    func nextN() -> UInt32 {
        
        if previousN == nil {
            previousN = selectedButton?.number
        }
        
        guard let previousN = previousN else {
            return 1
        }
        
        // find next button
        var nextN = arc4random_uniform(4) + 1
        while previousN == nextN {
            nextN = arc4random_uniform(4) + 1
        }
        
        self.previousN = nextN
        // plus 1 since the random will be between 0...3, but the button numbers are 1...4
        return nextN
    }
    
    func setNextTapItButtons() {
        
        // reset all buttons
        resetButtons()
        
        // set that button to tap it
        buttonForN(nextN()).setTapIt()
    }
    
    func resetButtons() {
        
        guard let game = game else {
            return
        }
        
        buttonOne.reset(game)
        buttonTwo.reset(game)
        buttonThree.reset(game)
        buttonFour.reset(game)
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

// crappy logic taken from old code
extension GameViewController {
    
    func chooseNextTaparooButtons() {
        
        var powerUp1 = arc4random_uniform(8)
        let powerUp2 = arc4random_uniform(8)
        var powerUp3 = arc4random_uniform(8)
        var powerUp4 = arc4random_uniform(8)
        
        while powerUp1 == powerUp2 || powerUp1 == powerUp3 || powerUp1 == powerUp4 || powerUp2 == powerUp3 || powerUp2 == powerUp4 || powerUp3 == powerUp4 {
            
            powerUp1 = arc4random_uniform(8)
            powerUp3 = arc4random_uniform(8)
            powerUp4 = arc4random_uniform(8)
        }
        buttonOne.setPowerUp(powerUp1)
        buttonTwo.setPowerUp(powerUp2)
        buttonThree.setPowerUp(powerUp3)
        buttonFour.setPowerUp(powerUp4)
    }
    
}
