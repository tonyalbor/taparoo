//
//  Game.swift
//  Taparoo
//
//  Created by Tony Albor on 11/3/15.
//  Copyright © 2015 Tony Albor. All rights reserved.
//

import UIKit

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

class Game: NSObject {
    
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
    
    func hitButton(button: TaparooButton) {
        
        if !canPlay {
            return
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
                return
            }
            
            fallthrough
            
        case .Endure:
            score += button.pointValue
            
        case .Taparoo:
            score += button.pointValue
        }
    }
}
