//
//  TaparooButton.swift
//  Taparoo
//
//  Created by Tony Albor on 10/25/15.
//  Copyright © 2015 Tony Albor. All rights reserved.
//

import UIKit

class TaparooButton: UIButton {
    
    var pointValue: Int = 1
    var number: UInt32 = 0
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func reset() {
        reset(.Classic)
    }
    
    func reset(mode: GameMode) {
        pointValue = 0
        setTitle("", forState: .Normal)
    }
    
    func gameOver() {
        let title = number % 2 != 0 ? "Game" : "Over!"
        setTitle(title, forState: .Normal)
    }
    
}

extension TaparooButton {
    
    func setTapIt() {
        
        pointValue = 1
        setTitle("Tap It!", forState: .Normal)
    }
}
