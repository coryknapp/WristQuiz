//
//  ViewController.swift
//  WristQuiz
//
//  Created by Cory Knapp on 4/8/19.
//  Copyright © 2019 Cory Knapp. All rights reserved.
//

import UIKit

class InterludeViewController: GameSessionTrackingViewController {

    // we want a view that can display text or an image, so we'll use an UIButton as a hack for now.
    @IBOutlet var resultField: InterfaceElement!
    @IBOutlet var countDownTimerText: UILabel!

    var timer: Timer!
    var countDownSecond: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if gameSession == nil{
            abort()
        }
        if gameSession!.responseIndex != nil{
            // we're coming back from answering a question
            let result = gameSession?.submitAnswer((gameSession!.responseIndex)!)
            if result == .right {
                resultField.setSuccessText("Correct!")
            }else{
                if gameSession!.currentQuestion!.imageOptions != nil{
                    // we want to show the user the correct image along with the failMessage
                    resultField.setImage( gameSession!.currentQuestion!.imageOptions![gameSession!.currentQuestion!.answerIndex], for: .normal)
                    
                }
                resultField.setFailText(gameSession!.currentQuestion!.failMessage ?? "")
            }
        }
        
        //start timer to advance to next interface
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFired), userInfo: nil, repeats: true)
        
        countDownSecond = 3
        refreshCountDownTimerText()
    }
    
    @IBAction func optionsButtonPressed(){
        
    }
    
    @objc func timerFired(){
        countDownSecond -= 1
        
        if(countDownSecond == 0){
            setUpNewQuestion()
        }
        
        refreshCountDownTimerText()
    }
    
    func refreshCountDownTimerText(){
        countDownTimerText.text = String(countDownSecond)
    }
    
    func setUpNewQuestion(){
        gameSession?.prepareNewQuestion()

        timer.invalidate()
        
        // assuming three response questions for now
        //WKInterfaceController.reloadRootControllers(withNamesAndContexts: [(name: "ThreeOptionInterfaceController", context: nextQuestion)])
        var newController = controller(forQuestion: (gameSession?.currentQuestion)!)
        
        
        newController.gameSession = gameSession
        self.present(newController, animated: true, completion: nil)
    }
    
    func controller(forQuestion question: TriviaQuestion) -> QuestionViewController {
        if question.stringOptions != nil {
            return self.storyboard?.instantiateViewController(withIdentifier: QuestionViewController.QuestionViewControllerTitles.ThreeStringOptionViewController.rawValue) as! QuestionViewController
        } else {
            return self.storyboard?.instantiateViewController(withIdentifier: QuestionViewController.QuestionViewControllerTitles.FourImageOptionViewController.rawValue) as! QuestionViewController
        }
    }
}

