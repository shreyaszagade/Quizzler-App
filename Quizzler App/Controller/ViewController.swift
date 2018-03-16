//
//  ViewController.swift
//  Quizzler App
//
//  Created by Shreyas Zagade on 3/10/18.
//  Copyright © 2018 Shreyas Zagade. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let allQuestions = QuestionBank()
    var pickedAnswer = false
    var currentQuestionNumber = 0
    var score = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBarView: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        updateUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func answerPressed(_ sender: UIButton) {
        
        if sender.tag == 1 {
            pickedAnswer = true
        }else{
            pickedAnswer = false
        }
        checkAnswer()
        nextQuestion()
    }
    
    func checkAnswer(){
        if pickedAnswer == allQuestions.list[currentQuestionNumber].correctAnswer{
            score += 1
            ProgressHUD.showSuccess("Your Answer is Correct")
        }else{
            ProgressHUD.showError("Your Answer is Wrong")
        }
    }
    
    func updateUI(){
        questionLabel.text = allQuestions.list[currentQuestionNumber].questionText
        updateProgress()
    }
    
    func nextQuestion(){
        if currentQuestionNumber < allQuestions.list.count - 1  {
            currentQuestionNumber += 1
            updateUI()
        }else{
            let alert = UIAlertController(title: "Awesome", message: "You have completed the quiz. Do you want to start over?", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart Quiz", style: .default, handler: { (UIAlertAction) in
                self.startOver()
            })
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
        }
    }
    
    func startOver(){
        currentQuestionNumber = 0
        score = 0
        updateUI()
    }
    
    func updateProgress(){
        scoreLabel.text = "Score: \(score)"
        progressLabel.text = "\(currentQuestionNumber+1) / \(allQuestions.list.count)"
        
        progressBarView.frame.size.width = ((view.frame.size.width / 13) * CGFloat(currentQuestionNumber + 1) )
        
        print(progressBarView.frame.size.width)
    }
    
}

