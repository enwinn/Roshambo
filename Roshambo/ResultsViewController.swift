//
//  ResultsViewController.swift
//  Roshambo
//
//  Created by Eric Winn on 4/19/15.
//  Copyright (c) 2015 Eric N. Winn. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var verdictImage: UIImageView!
    @IBOutlet weak var verdictLabel: UILabel!
    var playerChoice: Roshambo?
    var computerChoice: Roshambo?
    var verdictBanner: String = ""
    var youWin: String = " You win!"
    var youLose: String = " You lose!"
    
    override func viewWillAppear(animated: Bool) {
        
        // verdictImage only appears if both choices have been set
        // Start with verdict image and verdict banner hidden
        self.verdictImage.alpha = 0
        verdictLabel.alpha = 0
        
        // Determine the official results
        if playerChoice == computerChoice {
            self.verdictImage.image = UIImage(named: "itsATie")
            verdictLabel.text = "It's a TIE!"
        } else {
            switch (playerChoice!.rawValue + computerChoice!.rawValue) {
            // Rock (1) + Paper (2) = 3
            case 3:
                self.verdictImage.image = UIImage(named: "PaperCoversRock")
                verdictBanner = "Paper covers Rock."
                if playerChoice == .Rock {
                    verdictBanner += youLose
                } else {
                    verdictBanner += youWin
                }
                verdictLabel.text = verdictBanner
            // Rock (1) + Scissors (3) = 4
            case 4:
                self.verdictImage.image = UIImage(named: "RockCrushesScissors")
                verdictBanner = "Rock crushes Scissors."
                if playerChoice == .Rock {
                    verdictBanner += youWin
                } else {
                    verdictBanner += youLose
                }
                verdictLabel.text = verdictBanner
            // Scissors (3) + Paper (2) = 5
            case 5:
                self.verdictImage.image = UIImage(named: "ScissorsCutPaper")
                verdictBanner = "Scissors cut Paper."
                if playerChoice == .Scissors {
                    verdictBanner += youWin
                } else {
                    verdictBanner += youLose
                }
                verdictLabel.text = verdictBanner
                
            // Should never get here, could add an errorImage...
            default:
                self.verdictImage.image = UIImage(named: "itsATie")
                verdictLabel.text = "Hmmm, might have a problem!"
            }
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        // Fade in the results
        UIView.animateWithDuration(0.5, animations: {
            self.verdictImage.alpha = 1.0
            self.verdictLabel.alpha = 1.0
        })
    }
    
    @IBAction func playAgain(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}
