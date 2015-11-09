//
//  TaparooButton.swift
//  Taparoo
//
//  Created by Tony Albor on 10/25/15.
//  Copyright © 2015 Tony Albor. All rights reserved.
//

import UIKit

// todo :: make the background color a bit brighter when it is the Tap It! button

class TaparooButton: UIButton {
    
    var pointValue: Int = 1
    var number: UInt32 = 0
    var taparooColor: UIColor?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        taparooColor = backgroundColor
        layer.cornerRadius = 2 // todo :: tweak
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
    
    override var highlighted: Bool {
        get {
            return super.highlighted
        }
        set {
            if newValue {
                backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.1)
            } else {
                backgroundColor = taparooColor
            }
            super.highlighted = newValue
        }
    }
    
}

extension TaparooButton {
    
    func setTapIt() {
        
        pointValue = 1
        setTitle("Tap It!", forState: .Normal)
    }
}
