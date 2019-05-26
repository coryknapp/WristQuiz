//
//  QuestionViewController.swift
//  WristQuiz
//
//  Created by Cory Knapp on 5/14/19.
//  Copyright © 2019 Cory Knapp. All rights reserved.
//

import UIKit

class QuestionViewController : GameSessionTrackingViewController{
    
    @IBOutlet var QuestionTextLabel: UILabel!
    @IBOutlet var progressLabel: UILabel!
    
    //var currentQuestion : TriviaQuestion!
    //var currentRepsonse: TriviaQuestionResponse!

    override func viewDidLoad() {
        super.viewDidLoad()
        assert(gameSession != nil)

        QuestionTextLabel?.text = gameSession!.currentQuestion!.question
    }
    
    func returnToMain(){
        assert(gameSession!.responseIndex != nil)
        let newController = self.storyboard?.instantiateViewController(withIdentifier: "main")
        (newController as! ViewController).gameSession = gameSession
        self.present(newController!, animated: true, completion: nil)
    }
}
