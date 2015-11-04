//
//  TaparooButton.swift
//  Taparoo
//
//  Created by Tony Albor on 10/25/15.
//  Copyright © 2015 Tony Albor. All rights reserved.
//

import UIKit

enum ButtonType {
    case ChooseGameMode
    
}

enum GameMode: String {
    case Classic = "Classic"
    case Endure = "Endure"
    case Taparoo = "Taparoo"
    case Scatter = "Scatter"
}

enum GameLength: Double {
    case Thirty = 30
    case Sixty = 60
}

// keeps track of the current state of the game
// things i need:
// game mode
// game length
// score
// paused state
// pauses left

// something needs to determine the next button to be highlighted
// something that has access to all the buttons

class Game {
    
    // describe game type
    let mode: GameMode
    let length: GameLength
    
    // public
    var score: Int = 0
    var timeLeft: Double
    var gameOver: Bool = false
    var isPaused: Bool = false
    
    // private
    private var pausesRemaining: Int = 3
    private var timer: NSTimer
    private var hasStarted: Bool = false
    
    // whether player can pause the game
    var canPause: Bool {
        return !isPaused && pausesRemaining > 0
    }
    
    // whether player can play a move
    var canPlay: Bool {
        return !gameOver && !isPaused && timeLeft > 0
    }
    
    // standard initializer
    init(gameMode: GameMode, gameLength: GameLength) {
        mode = gameMode
        length = gameLength
        timeLeft = length.rawValue
        timer = NSTimer() // todo :: set up
    }
    
    // MARK: - game state modifiers
    
    func start() {
        // todo :: fire off timer
        hasStarted = true
    }
    
    func pause() -> Bool {
        
        if canPause {
            --pausesRemaining
            isPaused = true
            // todo :: pause timer
            
            return true
        }
        
        return false
    }
    
    func resume() -> Bool {
        
        if isPaused {
            isPaused = false
            // todo :: resume timer
            
            return true
        }
        
        return false
    }
    
    func end() {
        gameOver = true
        // todo :: stop timer
    }
    
    func restart() {
        
        gameOver = false
        isPaused = false
        score = 0
        timer = NSTimer()
        timeLeft = length.rawValue
        hasStarted = false
    }
    
    // MARK: - score
    
    /*
     * TODO :: maybe this can go elsewhere, like an extension or something
     * @param button - button which was last tapped
     * @return Bool - whether game can continue
     *
     */
    func hitButton(button: TaparooButton) -> Bool {
        
        // can't play a paused game
        if isPaused {
            return false
        }
        
        //
        if !hasStarted {
            start()
        }
        
        switch (mode) {
            
        case .Classic: fallthrough
        case .Scatter:
            
            if button.pointValue <= 0 {
                end()
                return false
            }
            
            score += button.pointValue
            return true
            
        case .Endure:
            button.pointValue <= 0 ? --score : ++score
            return true
            
        case .Taparoo:
            score += button.pointValue
            return true
        }
    }
}

class TaparooButton: UIButton {
    
    var pointValue: Int = 0
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

struct GameType {
    let mode: GameMode
    let length: GameLength
}

class Score {
    
    var points: Int = 0
    let type: GameType
    
    init(type: GameType) {
        self.type = type
    }
    
    func calculateScore(button: TaparooButton) {
        
        switch(type.mode) {
        case .Classic:
            break
        case .Endure:
            break
        case .Taparoo:
            break
        case .Scatter:
            break
            
        }
    }
    
}
