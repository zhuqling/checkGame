//
//  Card.swift
//  Match
//
//  Created by Cami on 9/5/15.
//  Copyright (c) 2015 Camille Diez. All rights reserved.
//

import UIKit

class Card: UIView {

    var backImageView:UIImageView = UIImageView()
    var frontImageView:UIImageView = UIImageView()
    var cardValue:Int = 0
    var cardNames:[String] = ["card1", "card2", "card3", "card4", "card5", "card6", "card7", "card8", "card9", "card10", "card11", "card12", "card13"]
    var isFlipped:Bool = false
    var isDone:Bool = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // TODO: Set default image for imageview
        backImageView.image = UIImage(named: "back")
        
        self.applyAutoLayoutConstraints(self.backImageView)
        self.applyAutoLayoutConstraints(self.frontImageView)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        // No need to fill: not making cards from the storyboard
    }
    
    func applyAutoLayoutConstraints (imageView:UIImageView) {
        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        self.addSubview (imageView)
        
        // TODO: Set constraints for the imageview
        var heightConstraint:NSLayoutConstraint = NSLayoutConstraint(item: imageView, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 170)
        
        var widthConstraint:NSLayoutConstraint = NSLayoutConstraint(item: imageView, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 120)
        
        applyPositionConstraints(imageView)
        
        imageView.addConstraints([heightConstraint, widthConstraint])
    }
    
    func applyPositionConstraints (imageView:UIImageView) {
        var verticalConstraint:NSLayoutConstraint = NSLayoutConstraint(item: imageView, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Top, multiplier: 1, constant: 0)
        
        var horizontalConstraint:NSLayoutConstraint = NSLayoutConstraint(item: imageView, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Left, multiplier: 1, constant: 0)
        
        self.addConstraints([verticalConstraint, horizontalConstraint])
    }
    
    func flipUp() {
        self.frontImageView.image = UIImage(named: self.cardNames[self.cardValue])
        
        // Animations
        UIView.transitionFromView(self.backImageView, toView: self.frontImageView, duration: 0.5, options: UIViewAnimationOptions.TransitionFlipFromLeft, completion: nil)
        
        self.applyPositionConstraints(self.frontImageView)
        
        isFlipped = true
    }
    
    func flipDown() {
        UIView.transitionFromView(self.frontImageView, toView: self.backImageView, duration: 0.5, options: UIViewAnimationOptions.TransitionFlipFromRight, completion: nil)

        self.applyPositionConstraints(self.backImageView)
        
        isFlipped = false
    }
    
    func hideCard() {
        UIView.animateWithDuration(1, delay: 1, options: UIViewAnimationOptions.CurveEaseOut, animations: {
            
            self.frontImageView.alpha = 0
            self.backImageView.alpha = 0
            
            }, completion: nil)
        
        self.isDone = true
        
        
    }

}
