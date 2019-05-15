//
//  QuestionViewController.swift
//  WristQuiz
//
//  Created by Cory Knapp on 5/14/19.
//  Copyright © 2019 Cory Knapp. All rights reserved.
//

import UIKit

class QuestionViewController : UIViewController{
    
    @IBOutlet var QuestionTextLabel: UILabel?
    
    var currentQuestion : TriviaQuestion!
    var currentRepsonse: TriviaQuestionResponse!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentRepsonse = TriviaQuestionResponse()
        currentRepsonse.triviaQuestion = currentQuestion
        
        QuestionTextLabel?.text = currentQuestion.question
    }
    
    func returnToMain(){
        let newController = self.storyboard?.instantiateViewController(withIdentifier: "main")
        
        
        (newController as! ViewController).results = currentRepsonse
        self.present(newController!, animated: true, completion: nil)
    }
}
