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
    @IBOutlet weak var contentView: UIView!
    
    var gameModel: GameModel = GameModel()
    var cards:[Card]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Get cards from the game model
        self.cards = self.gameModel.getCards()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

