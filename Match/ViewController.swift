//
//  ViewController.swift
//  Match
//
//  Created by Cami on 9/5/15.
//  Copyright (c) 2015 Camille Diez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView! // Safely assume the variable has a value associated to it
    
    var gameModel: GameModel = GameModel()
    var cards:[Card] = [Card]()
    var revealedCard:Card? // Containing a value is optional/can be null?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Get cards from the game model
        self.cards = self.gameModel.getCards()
        
        // Layout
        self.layoutCards()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func layoutCards() {
        
        var columnCounter:Int = 0
        var rowCounter:Int = 0
        
        // Loop through each card in the array
        for index in 0...self.cards.count-1 {
            
            // Place the card in the view and turn off translateautoresizemask
            var tempCard:Card = self.cards[index]
            tempCard.setTranslatesAutoresizingMaskIntoConstraints(false)
            self.contentView.addSubview(tempCard)
            
            // Handles tap gesture
            var tapGestureRecognizer: UITapGestureRecognizer = UITapGestureRecognizer (target: self, action: Selector("cardTapped:"))
            tempCard.addGestureRecognizer(tapGestureRecognizer)
            
            // Set the height and width constraints
            var heightConstraint:NSLayoutConstraint = NSLayoutConstraint(item: tempCard, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 170)

            var widthConstraint:NSLayoutConstraint = NSLayoutConstraint(item: tempCard, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 120)
            
            tempCard.addConstraints([heightConstraint, widthConstraint])
            
            // Set the horizontal position
            if (columnCounter > 0) {
                // Card is not in the first column
                var cardOnTheLeft:Card = self.cards[index-1]
                
                var leftMarginConstraint:NSLayoutConstraint = NSLayoutConstraint(item: tempCard, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: cardOnTheLeft, attribute: NSLayoutAttribute.Right, multiplier: 1, constant: 5)
                
                self.contentView.addConstraint(leftMarginConstraint)
                
            } else {
                // Card is in the first column
                var leftMarginConstraint:NSLayoutConstraint = NSLayoutConstraint(item: tempCard, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: self.contentView, attribute: NSLayoutAttribute.Left, multiplier: 1, constant: 0)
                
                // Add constraint
                self.contentView.addConstraint(leftMarginConstraint)
                
                
            }
            
            // Set the vertical position
            if (rowCounter > 0) {
                // Card is not in the first row
                var cardOnTop:Card = self.cards[index-4]
                
                var topMarginConstraint:NSLayoutConstraint = NSLayoutConstraint(item: tempCard, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: cardOnTop, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 5)
                
                self.contentView.addConstraint(topMarginConstraint)
                
            } else {
                // Card is in the first row
                var topMarginConstraint:NSLayoutConstraint = NSLayoutConstraint(item: tempCard, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self.contentView, attribute: NSLayoutAttribute.Top, multiplier: 1, constant: 10)
                
                self.contentView.addConstraint(topMarginConstraint)
                
            }
            
            // Increment the counter
            columnCounter += 1
            if (columnCounter >= 4) {
                columnCounter = 0
                rowCounter += 1
            }
        } // End For Loop
        
        // Add height constraint to the content view so scrollview knows how much to scroll
        var contentViewHeightConstraint:NSLayoutConstraint = NSLayoutConstraint (item: self.contentView, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: self.cards[0], attribute: NSLayoutAttribute.Height, multiplier: 4, constant: 35)
        
        self.contentView.addConstraint(contentViewHeightConstraint)
    } // End layoutCards()

    func cardTapped(recognizer:UITapGestureRecognizer) {
        //
        var cardThatWasTapped:Card = recognizer.view as! Card
        
        if (!cardThatWasTapped.isFlipped) {
            if (self.revealedCard == nil) { // First Card
                // Flip down all cards
                self.flipDownAllCards()
                // Flip card up
                cardThatWasTapped.flipUp()
                self.revealedCard = cardThatWasTapped
                
            } else { // Second Card
                // Flip card up
                cardThatWasTapped.flipUp()
                if (revealedCard?.cardValue == cardThatWasTapped.cardValue) { // Cards are the same
                    // Hide both cards
                    self.revealedCard?.hideCard()
                    cardThatWasTapped.hideCard()
                } // else do nothing
                self.revealedCard = nil
            }
        } // If it's flipped, do nothing
    }
    
    func flipDownAllCards () {
        for card in self.cards {
            if (!card.isDone) {
                card.flipDown()
            }
        }
    }
}

