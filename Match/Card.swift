//
//  Card.swift
//  Match
//
//  Created by Cami on 9/5/15.
//  Copyright (c) 2015 Camille Diez. All rights reserved.
//

import UIKit

class Card: UIView {

    var cardImageView:UIImageView = UIImageView()
    var cardValue:Int = 0
    var cardNames:[String] = ["ace", "card2", "card3", "card4", "card5", "card6", "card7", "card8", "card9", "card10", "jack", "queen", "king"]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // TODO: Set default image for imageview
        self.backgroundColor = UIColor.redColor()
        
        // TODO: Add imageview for the view
        // TODO: Set constraints for the imageview
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        // No need to fill: not making cards from the storyboard
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
