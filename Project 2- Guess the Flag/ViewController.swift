//
//  ViewController.swift
//  Project 2- Guess the Flag
//
//  Created by Zach Spinler on 3/7/20.
//  Copyright © 2020 Zach Spinler. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries       = ["estonia", "france","germany","ireland","italy","monaco","nigeria","poland","russia","spain","uk","us"]
    var score           = 0
    var correctAnswer   = 0
    var questionTracker = 0 // Challenge 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(showScore))
        
        randomFlags()
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
    }
    
    func restart(action: UIAlertAction! = nil) {
        score           = 0
        correctAnswer   = 0
        questionTracker = 0
    }
    
    func randomFlags(action: UIAlertAction! = nil) {
        
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        title         = countries[correctAnswer].uppercased() + " Player's Score: \(score)" //Challenge1
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
    }
    

    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        questionTracker += 1
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong! That's the flag of \(countries[sender.tag].uppercased())" // Challenge3
            score -= 1
        }
        
        if questionTracker == 4 {
            //Challenge 2
          let ac = UIAlertController(title: "Final Score: \(score)", message: nil, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Restart", style: .default, handler: randomFlags))
            present(ac, animated: true)
            restart()
        }
        
        let ac = UIAlertController(title: title, message: "Your score is \(score).", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: randomFlags))
        present(ac, animated: true)
    }
    
    @objc func showScore() {
        let ac = UIAlertController(title: "Score: \(score)", message: nil, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK.", style: .default))
        present(ac, animated: true)    }
    
}

