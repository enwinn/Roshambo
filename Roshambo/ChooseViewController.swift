//
//  ChooseViewController.swift
//  Roshambo
//
//  Created by Eric Winn on 4/19/15.
//  Copyright (c) 2015 Eric N. Winn. All rights reserved.
//

// TODO: Add scoring display with persistence

import UIKit

enum Roshambo: Int {
    case Rock = 1
    case Paper = 2
    case Scissors = 3
}


class ChooseViewController: UIViewController {
    
    // Generate the computer's choice
    // Using enum to make the results code easy and fun
    func randomRockPaperScissors() -> Roshambo {
        let randomValue = 1 + arc4random() % 3
        let computerChoice = Roshambo(rawValue: Int(randomValue))
        
        return computerChoice!
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let controller = segue.destinationViewController as! ResultsViewController
        controller.computerChoice = self.randomRockPaperScissors()
        
        if segue.identifier == "choosePaper" {
            controller.playerChoice = Roshambo.Paper
        }
        
        if segue.identifier == "chooseScissors" {
            controller.playerChoice = Roshambo.Scissors
        }
        
    }

    @IBAction func chooseRock(sender: UIButton) {
        
        var controller: ResultsViewController
        
        controller = self.storyboard?.instantiateViewControllerWithIdentifier("ResultsViewController") as! ResultsViewController
        
        controller.playerChoice = Roshambo.Rock
        controller.computerChoice = self.randomRockPaperScissors()
        
        self.presentViewController(controller, animated: true, completion: nil)
        
    }
    
    @IBAction func choosePaper(sender: UIButton) {
        performSegueWithIdentifier("choosePaper", sender: self)
    }
    
    @IBAction func chooseScissors(sender: UIButton) {
    }
}
