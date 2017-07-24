//
//  ViewController.swift
//  War
//
//  Created by Kajal Agarwal on 7/22/17.
//  Copyright © 2017 Kajal Agarwal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var rightImageView: UIImageView!
    @IBOutlet weak var rightScoreLabel: UILabel!
    var rightScore = 0
    
    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var leftScoreLabel: UILabel!
    var leftScore = 0
    
    var numberOfDeals = 0
    @IBOutlet weak var winnerLabel: UILabel!
    
    @IBOutlet weak var deals: UILabel!
    
    let cardNames = ["card2", "card3", "card4", "card5", "card6", "card7", "card8", "card9", "card10", "jack", "queen", "king", "ace"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func winningText(leftScore:Int, rightScore:Int) {
        if leftScore > rightScore {
            winnerLabel.text = "Player Wins Hurray!!!"
        }
        else if leftScore == rightScore {
            winnerLabel.text = "It's a tie!!!"
        }
        else {
            winnerLabel.text = "Computer Wins Hurray!!!"
        }
    }
    
    func updateScore(leftNumber:Int, rightNumber:Int) {
        if leftNumber > rightNumber {
            leftScore += 1
            leftScoreLabel.text = String(leftScore)
        }
        else if leftNumber == rightNumber {
        }
        else {
            rightScore += 1
            rightScoreLabel.text = String(rightScore)
        }
    }

    @IBAction func dealTapped(sender: UIButton) {
        // Randomize the left card number and make sure it is Int datatype
        let leftNumber = Int(arc4random_uniform(13))
        numberOfDeals += 1
        
        deals.text = String(numberOfDeals)
        leftImageView.image = UIImage(named: cardNames[leftNumber])
        
        // Randomize the right card number and make sure it is Int datatype
        let rightNumber = Int(arc4random_uniform(13))
        
        rightImageView.image = UIImage(named: cardNames[rightNumber])
        
        updateScore(leftNumber, rightNumber: rightNumber)
        
        if numberOfDeals == 10 {
            winningText(leftScore, rightScore: rightScore)
            sender.enabled = false
        }
    }

}

