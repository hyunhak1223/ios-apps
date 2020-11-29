//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var QuestionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var choice1button: UIButton!
    @IBOutlet weak var choice2button: UIButton!
    @IBOutlet weak var choice3button: UIButton!
    
    
    
    @IBOutlet weak var barProgress: UIProgressView!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()

    
}

    @IBAction func choiceButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle! // ture or false
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
      
        

    }
    
    @objc func updateUI() {
        QuestionLabel.text = quizBrain.getQuestionText()
        choice1button.backgroundColor = UIColor.clear
        choice2button.backgroundColor = UIColor.clear
        choice3button.backgroundColor = UIColor.clear
        barProgress.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        let choiceTitle = quizBrain.getChoiceText()
        choice1button.setTitle(choiceTitle[0], for: .normal)
        choice2button.setTitle(choiceTitle[1], for: .normal)
        choice3button.setTitle(choiceTitle[2], for: .normal)
    }
    
}
