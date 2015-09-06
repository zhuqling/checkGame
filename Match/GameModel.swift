//
//  GameModel.swift
//  Match
//
//  Created by Cami on 9/5/15.
//  Copyright (c) 2015 Camille Diez. All rights reserved.
//

import UIKit

class GameModel: NSObject {
    func getCards () -> [Card] {
        var generatedCards:[Card] = [Card]()
        
        // Generate card objects
        for index in 0...7 {
            // Generate a random number
            var randNumber:Int = Int(arc4random_uniform(13))
            
            // Create a new Card object
            var firstCard:Card = Card()
            firstCard.cardValue = randNumber
            
            // Create previous Card object's pair
            var secondCard:Card = Card()
            secondCard.cardValue = randNumber
            
            generatedCards += [firstCard, secondCard]
            
        }
        // Randomise the cards
        for index in 0...generatedCards.count - 1 {
            var randIndex:Int = Int(arc4random_uniform(16))
            var tempCard = generatedCards[index]
            generatedCards[index] = generatedCards[randIndex]
            generatedCards[randIndex] = tempCard
            
        }
        return generatedCards
    }
}
