//
//  Game.swift
//  Taparoo
//
//  Created by Tony Albor on 11/3/15.
//  Copyright © 2015 Tony Albor. All rights reserved.
//

import UIKit

enum GameState: Int {
    case Waiting
    case Active
    case Paused
    case GameOver
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

protocol GameDelegate {
    func timerUpdated()
    func timerEnded()
}

class Game: NSObject {
    
    // describe game type
    let mode: GameMode
    let length: GameLength
    
    // public
    var score: Int = 0
    var pauses: Int = 3
    var timeLeft: Double
    var state: GameState
    
    // timer
    private var timer: NSTimer?
    private var timeInterval: NSTimeInterval?
    
    var gameDelegate: GameDelegate?
    
    // whether player can pause the game
    var canPause: Bool {
        return state == .Active  && pauses > 0
    }
    
    // standard initializer
    init(gameMode: GameMode, gameLength: GameLength) {
        mode = gameMode
        length = gameLength
        state = .Waiting
        timeLeft = length.rawValue
        super.init()
    }
    
    // MARK: - game state modifiers
    
    func start() {
        
        state = .Active
        timeInterval = timeIntervalForGameMode()
        timer = NSTimer.scheduledTimerWithTimeInterval(timeInterval!, target: self, selector: "tick", userInfo: nil, repeats: true)
    }
    
    func pause() {
        state = .Paused
        --pauses
    }
    
    func resume() {
        state = .Active
    }
    
    func end() {
        state = .GameOver
        timer?.invalidate()
        timer = nil
    }
    
    func restart() {
        
        state = .Waiting
        score = 0
        timer?.invalidate()
        timer = nil
        timeLeft = length.rawValue
        gameDelegate?.timerUpdated()
    }
    
    func save() {
        
        // nscoding
    }
    
    // MARK: - Score
    
    func hitButton(button: TaparooButton) {
        
        switch (mode) {
            
        case .Classic:
            fallthrough
            
        case .Scatter:
            if button.pointValue <= 0 {
                end()
            } else {
                fallthrough
            }
            
        case .Endure:
            fallthrough
            
        case .Taparoo:
            score += button.pointValue
        }
        
        // no negative scores
        if score < 0 {
            score = 0
        }
    }
    
    // MARK: - Timer
    
    private func timeIntervalForGameMode() -> NSTimeInterval {
        
        if mode == .Scatter {
            return 0.02
        } else {
            return 0.1
        }
    }
    
    func tick() {
        
        if state == .Paused {
            return
        }
        
        guard let timeInterval = timeInterval else {
            return
        }
        
        switch (mode) {
            
        case .Classic:
            fallthrough
            
        case .Endure:
            fallthrough
            
        case .Taparoo:
            timeLeft -= timeInterval
            break
            
        case .Scatter:
            // scatter the buttons around
            timeLeft -= timeInterval
            break
        }
        
        if timeLeft <= 0 {
            
            timeLeft = 0
            timer?.invalidate()
            timer = nil
            
            state = .GameOver
            
            gameDelegate?.timerEnded()
        } else {
            gameDelegate?.timerUpdated()
        }
    }
}
