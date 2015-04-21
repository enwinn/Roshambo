//
//  ResultsViewController.swift
//  Roshambo
//
//  Created by Eric Winn on 4/19/15.
//  Copyright (c) 2015 Eric N. Winn. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var playerChoice: Roshambo?
    var computerChoice: Roshambo?
    

    @IBOutlet weak var verdictImage: UIImageView!
    
    @IBOutlet weak var verdictLabel: UILabel!
    var verdictBanner: String = ""
    
    override func viewWillAppear(animated: Bool) {
        
        // verdictImage only appears if both choices have been set
        var pChoice = ""
        var cChoice = ""
        if let playerChoice = self.playerChoice {
            switch playerChoice {
            case .Rock: pChoice = "Rock"
            case .Paper: pChoice = "Paper"
            case .Scissors: pChoice = "Scissors"
            default: println("Player's choice: Something broke, call AAA!")
            }
        }
        
        if let computerChoice = self.computerChoice {
            // call the verdict function
            switch computerChoice {
            case .Rock: cChoice = "Rock"
            case .Paper: cChoice = "Paper"
            case .Scissors: cChoice = "Scissors"
            default: println("Computer's choice: Something broke, call AAA!")
            }
        }
        println("----------")
        println("Player's choice: \(pChoice), Computer's choice: \(cChoice)")
        
        // Display the verdict Image
        self.verdictImage.alpha = 0
        verdictLabel.alpha = 0
        
        // Determine the official results
        if playerChoice == computerChoice {
            self.verdictImage.image = UIImage(named: "itsATie")
            verdictLabel.text = "It's a TIE!"
        } else {
            switch (playerChoice!.rawValue + computerChoice!.rawValue) {
            case 3:
                self.verdictImage.image = UIImage(named: "PaperCoversRock")
                verdictBanner = "Paper covers Rock."
                if playerChoice == .Rock {
                    verdictBanner += " You lose!"
                } else {
                    verdictBanner += " You win!"
                }
                verdictLabel.text = verdictBanner
            case 4:
                self.verdictImage.image = UIImage(named: "RockCrushesScissors")
                verdictBanner = "Rock crushes Scissors."
                if playerChoice == .Rock {
                    verdictBanner += " You win!"
                } else {
                    verdictBanner += " You lose!"
                }
                verdictLabel.text = verdictBanner
            case 5:
                self.verdictImage.image = UIImage(named: "ScissorsCutPaper")
                verdictBanner = "Scissors cut Paper."
                if playerChoice == .Scissors {
                    verdictBanner += " You win!"
                } else {
                    verdictBanner += " You lose!"
                }
                verdictLabel.text = verdictBanner
            default:
                self.verdictImage.image = UIImage(named: "itsATie")
                verdictLabel.text = "Hmmm, might have a problem!"
            }
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        
        UIView.animateWithDuration(1.5, animations: {
            self.verdictImage.alpha = 1.0
            self.verdictLabel.alpha = 1.0
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func playAgain(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}
