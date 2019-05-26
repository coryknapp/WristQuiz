//
//  ViewController.swift
//  WristQuiz
//
//  Created by Cory Knapp on 4/8/19.
//  Copyright © 2019 Cory Knapp. All rights reserved.
//

import UIKit

class ViewController: GameSessionTrackingViewController {

    @IBOutlet var resultText: UILabel!
    @IBOutlet var countDownTimerText: UILabel!

    var timer: Timer!
    var countDownSecond: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if gameSession == nil{
            // we're just starting the app.  Display a splash screen.
            resultText.text = "Get Ready!"
            resultText.textColor = Style.successColor
            
            // now set up a new GameSession
            gameSession = GameSession()
            gameSession?.triviaCollection = PresidentCollection()
            
        }else{
            // we're coming back from answering a question
            var result = gameSession?.submitAnswer((gameSession?.responseIndex)!)
            if result == .right {
                resultText.attributedText = NSAttributedString(string: "Correct", attributes: [NSAttributedString.Key.font : Style.successFont, NSAttributedString.Key.foregroundColor: Style.successColor])
            }else{
                resultText.attributedText = NSAttributedString(string: gameSession!.currentQuestion!.failMessage, attributes: [NSAttributedString.Key.font : Style.failFont, NSAttributedString.Key.foregroundColor: Style.failColor])
            }
        }
        
        //start timer to advance to next interface
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFired), userInfo: nil, repeats: true)
        
        countDownSecond = 3
        refreshCountDownTimerText()
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
        let collection = PresidentCollection()
        gameSession?.prepareNewQuestion()

        timer.invalidate()
        
        // assuming three response questions for now
        //WKInterfaceController.reloadRootControllers(withNamesAndContexts: [(name: "ThreeOptionInterfaceController", context: nextQuestion)])
        var newController = self.storyboard?.instantiateViewController(withIdentifier: "ThreeOptionViewController")
        
        
        (newController as! QuestionViewController).gameSession = gameSession
        self.present(newController!, animated: true, completion: nil)
    }
}

