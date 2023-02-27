//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let userGotRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotRight {
            sender.backgroundColor = UIColor.green.withAlphaComponent(0.5)
            sender.layer.cornerRadius = 20
//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
//                sender.backgroundColor = UIColor.clear
//                print("True")
//            }
        } else {
            sender.backgroundColor = UIColor.red.withAlphaComponent(0.5)
            sender.layer.cornerRadius = 20
//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
//                sender.backgroundColor = UIColor.clear
//                print("False")
//            }
        }
           
           quizBrain.nextQuestion()
           
           Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI(){
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        let answerChoices = quizBrain.getAnswers()
        answer1.setTitle(answerChoices[0], for: .normal)
        answer2.setTitle(answerChoices[1], for: .normal)
        answer3.setTitle(answerChoices[2], for: .normal)
        
        answer1.backgroundColor = UIColor.clear
        answer2.backgroundColor = UIColor.clear
        answer3.backgroundColor = UIColor.clear
        
    }
    
    
    
}

