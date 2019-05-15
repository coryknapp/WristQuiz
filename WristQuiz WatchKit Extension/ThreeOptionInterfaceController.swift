//
//  InterfaceController.swift
//  WristQuiz WatchKit Extension
//
//  Created by Cory Knapp on 4/8/19.
//  Copyright © 2019 Cory Knapp. All rights reserved.
//

import WatchKit
import Foundation

class ThreeOptionInterfaceController: TriviaQuestionInterfaceController{
    
    @IBOutlet var questionField: WKInterfaceLabel!
    @IBOutlet var firstButton: WKInterfaceButton!
    @IBOutlet var secondButton: WKInterfaceButton!
    @IBOutlet var thirdButton: WKInterfaceButton!

    @IBAction func firstButtonPressed(){
        currentRepsonse.answerIndex = 0
        displayResult()
    }
    
    @IBAction func secondButtonPressed(){
        currentRepsonse.answerIndex = 1
        displayResult()
    }
    
    @IBAction func thirdButtonPressed(){
        currentRepsonse.answerIndex = 2
        displayResult()
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        questionField.setText(currentQuestion.question)
        firstButton.setTitle(currentQuestion.options[0])
        secondButton.setTitle(currentQuestion.options[1])
        thirdButton.setTitle(currentQuestion.options[2])
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
}
