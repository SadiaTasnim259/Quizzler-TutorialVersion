//
//  ViewController.swift
//  Quizzler-TutorialVersion
//
//  Created by Sadia on 28/7/23.
//

import UIKit

class ViewController: UIViewController {
    
    var quizBrain = QuizBrain()

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        updateQuestion()
    }
    
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let givenAns = sender.titleLabel!.text
        
        quizBrain.checkAnswer(givenAns!)
        
        if givenAns == quizBrain.correctAns {
            sender.backgroundColor = UIColor.green
        }else{
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        self.timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateQuestion), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateQuestion(){
        timer.invalidate()
        questionLabel.text = quizBrain.quiz[quizBrain.questionNumber].q
        quizBrain.correctAns = quizBrain.quiz[quizBrain.questionNumber].a
        
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.score)"
        trueButton.backgroundColor = UIColor(named: "backgroundColor")
        falseButton.backgroundColor = UIColor(named: "backgroundColor")
        
    }
    
    

}

