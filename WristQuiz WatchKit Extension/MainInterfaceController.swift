//
//  MainInterfaceController.swift
//  WristQuiz WatchKit Extension
//
//  Created by Cory Knapp on 4/18/19.
//  Copyright © 2019 Cory Knapp. All rights reserved.
//

import WatchKit
import Foundation

class MainInterfaceController: WKInterfaceController {

    @IBOutlet var resultText: WKInterfaceLabel!
    @IBOutlet var countDownTimerText: WKInterfaceLabel!
    
    var timer: Timer!
    var countDownSecond: Int = 0
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        if( context == nil){
            // we're just starting the app.  Display a splash screen.
            resultText.setText("Get Ready!")
            resultText.setTextColor(Style.successColor)
        }else{
            // we're coming back from answering a question
            var gameSession = (context as! GameSession)
            if(gameSession.submitAnswer(gameSession.responseIndex!) == .right){
                resultText.setAttributedText(NSAttributedString(string: "Correct", attributes: [NSAttributedString.Key.font : Style.successFont, NSAttributedString.Key.foregroundColor: Style.successColor]))
            }else{
                resultText.setAttributedText(NSAttributedString(string: gameSession.currentQuestion!.failMessage!, attributes: [NSAttributedString.Key.font : Style.failFont, NSAttributedString.Key.foregroundColor: Style.failColor]))
            }
        }
        
        //start timer to advance to next interface
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFired), userInfo: nil, repeats: true)
        
        countDownSecond = 3
        refreshCountDownTimerText()
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    @objc func timerFired(){
        countDownSecond -= 1
        
        if(countDownSecond == 0){
            setUpNewQuestion()
        }
        
        refreshCountDownTimerText()
    }
    
    func refreshCountDownTimerText(){
        countDownTimerText.setText(String(countDownSecond))
    }
    
    func setUpNewQuestion(){
        let collection = PresidentCollection()
        let nextQuestion = collection.getQuestion(difficulty: 0)
        
        timer.invalidate()
        
        // assuming three response questions for now
        WKInterfaceController.reloadRootControllers(withNamesAndContexts: [(name: "ThreeOptionInterfaceController", context: nextQuestion)])
    }
}
