//
//  ViewController.swift
//  Dice Race
//
//  Created by Siddharth Rajan on 6/6/17.
//  Copyright © 2017 CodeOfSid. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var yourtotal = 0
    var mytotal = 0
    
    var numberOne = 0
    var numberTwo = 0
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var label2: UILabel!
    
    @IBOutlet weak var topLeftImageView: UIImageView!
    @IBOutlet weak var topRightImageView: UIImageView!
    
    @IBOutlet weak var bottomLeftImageView: UIImageView!
    @IBOutlet weak var bottomRightImageView: UIImageView!
    
    @IBOutlet weak var middleLabel: UILabel!
    
    let dice = ["Dice1", "Dice2", "Dice3", "Dice4", "Dice5", "Dice6"]
    
    @IBAction func rollTapped(_ sender: UIButton) {
        
        if yourtotal >= 150 || mytotal >= 150 {
            
            yourtotal = 0
            mytotal = 0
            
            topLeftImageView.image = UIImage(named: "Roll")
            topRightImageView.image = UIImage(named: "Roll")
            
            bottomLeftImageView.image = UIImage(named: "Roll")
            bottomRightImageView.image = UIImage(named: "Roll")
            
            label.text = "Your total sum now is: \(yourtotal)"
            label2.text = "My total sum now is: \(mytotal)"
            
            middleLabel.text = "Target: 150"
            
        }
        
        else if yourtotal < 150 && mytotal < 150 {
        
            numberOne = Int(arc4random_uniform(5) + 1)
            numberTwo = Int(arc4random_uniform(5) + 1)
        
            topLeftImageView.image = UIImage(named: dice[numberOne - 1])
            topRightImageView.image = UIImage(named: dice[numberTwo - 1])
        
            yourtotal += (numberOne + numberTwo)
        
            label.text = "Your total sum now is: \(yourtotal)"
        
            numberOne = Int(arc4random_uniform(5) + 1)
            numberTwo = Int(arc4random_uniform(5) + 1)
        
            bottomLeftImageView.image = UIImage(named: dice[numberOne - 1])
            bottomRightImageView.image = UIImage(named: dice[numberTwo - 1])
        
            mytotal += (numberOne + numberTwo)
        
            label2.text = "My total sum now is: \(mytotal)"
        
            if yourtotal >= 150 && mytotal < 150 {
                middleLabel.text = "You Won!"
            }
            else if mytotal >= 150 && yourtotal < 150 {
                middleLabel.text = "You Lost!"
            }
            else if yourtotal >= 150 && mytotal >= 150 {
                if yourtotal > mytotal {
                    middleLabel.text = "You Won!"
                }
                else if mytotal > yourtotal {
                    middleLabel.text = "You Lost!"
                }
                else if yourtotal == mytotal {
                    middleLabel.text = "It's a Tie!"
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

