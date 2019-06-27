//
//  QuestionViewController.swift
//  WristQuiz
//
//  Created by Cory Knapp on 5/14/19.
//  Copyright © 2019 Cory Knapp. All rights reserved.
//

import UIKit

class QuestionViewController : GameSessionTrackingViewController{
    
    enum QuestionViewControllerTitles : String {
        case FourImageOptionViewController = "FourImageOptionViewController"
        case ThreeStringOptionViewController = "ThreeStringOptionViewController"
    }
    
    @IBOutlet var QuestionTextLabel: UIButton! // Use a button instead of a label so we can use it to show images
    @IBOutlet var progressLabel: UILabel!
    
    @IBOutlet var firstButton: UIButton!
    @IBOutlet var secondButton: UIButton!
    @IBOutlet var thirdButton: UIButton!
    @IBOutlet var fourthButton: UIButton? // not all views have four buttons
    
    //var currentQuestion : TriviaQuestion!
    //var currentRepsonse: TriviaQuestionResponse!

    override func viewDidLoad() {
        super.viewDidLoad()
        assert(gameSession != nil)

        if gameSession?.currentQuestion?.stringQuestion != nil {
            QuestionTextLabel?.setTitle(gameSession!.currentQuestion!.stringQuestion, for: UIControl.State.normal)
        } else if gameSession?.currentQuestion?.imageQuestion != nil {
            QuestionTextLabel?.setImage(gameSession!.currentQuestion!.imageQuestion, for: UIControl.State.normal)
        } else {
            assert(false)
        }
        
        if gameSession?.currentQuestion?.stringOptions != nil {
            firstButton!.setTitle(gameSession!.currentQuestion!.stringOptions![0], for: UIControl.State.normal)
            secondButton!.setTitle(gameSession!.currentQuestion!.stringOptions![1], for: UIControl.State.normal)
            thirdButton!.setTitle(gameSession!.currentQuestion!.stringOptions![2], for: UIControl.State.normal)
            fourthButton?.setTitle(gameSession!.currentQuestion!.stringOptions![4], for: UIControl.State.normal)
        } else if gameSession?.currentQuestion?.imageOptions != nil {
            print(gameSession!.currentQuestion!.imageOptions![0].size.debugDescription)
            
            firstButton!.setTitle(nil, for: UIControl.State.normal)
            secondButton!.setTitle(nil, for: UIControl.State.normal)
            thirdButton!.setTitle(nil, for: UIControl.State.normal)
            fourthButton?.setTitle(nil, for: UIControl.State.normal)
            
            firstButton!.setImage(gameSession!.currentQuestion!.imageOptions![0], for: UIControl.State.normal)
            secondButton!.setImage(gameSession!.currentQuestion!.imageOptions![1], for: UIControl.State.normal)
            thirdButton!.setImage(gameSession!.currentQuestion!.imageOptions![2], for: UIControl.State.normal)
            fourthButton?.setImage(gameSession!.currentQuestion!.imageOptions![3], for: UIControl.State.normal)
        }
    }
    
    @IBAction func buttonPressed(sender: UIButton){
        var buttonIndex = 0
        switch sender {
        case firstButton:
            buttonIndex = 0
        case secondButton:
            buttonIndex = 1
        case thirdButton:
            buttonIndex = 2
        case fourthButton:
            buttonIndex = 3
        default:
            assert(false, "Unknown sender")
        }
        
        gameSession!.responseIndex = buttonIndex
        self.returnToMain()
    }
    
    func returnToMain(){
        assert(gameSession!.responseIndex != nil)
        let newController = self.storyboard?.instantiateViewController(withIdentifier: "InterludeViewController")
        (newController as! InterludeViewController).gameSession = gameSession
        self.present(newController!, animated: true, completion: nil)
    }
}
