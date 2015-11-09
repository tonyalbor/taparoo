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

class Game: NSObject {
    
    // describe game type
    let mode: GameMode
    let length: GameLength
    
    // public
    var score: Int = 0
    var pauses: Int = 3
    var timeLeft: Double
    var state: GameState
    
    private var timer: NSTimer
    
    // whether player can pause the game
    var canPause: Bool {
        return state == .Active  && pauses > 0
    }
    
    // standard initializer
    init(gameMode: GameMode, gameLength: GameLength) {
        mode = gameMode
        length = gameLength
        timeLeft = length.rawValue
        timer = NSTimer() // todo :: set up
        state = .Waiting
        super.init()
    }
    
    // MARK: - game state modifiers
    
    func start() {
        // todo :: fire off timer
        state = .Active
    }
    
    func pause() {
        
        // todo :: pause timer
        --pauses
        state = .Paused
    }
    
    func resume() {
        
        // todo :: resume timer
        state = .Active
    }
    
    func end() {
        state = .GameOver
        // todo :: stop timer
    }
    
    func restart() {
        
        state = .Waiting
        score = 0
        timer = NSTimer()
        timeLeft = length.rawValue
    }
    
    func save() {
        
        // nscoding
    }
    
    // MARK: - score
    
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
    }
}
