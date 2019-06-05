//
//  ThreeOptionInterfaceController.swift
//  WristQuiz
//
//  Created by Cory Knapp on 5/10/19.
//  Copyright © 2019 Cory Knapp. All rights reserved.
//

import UIKit

class ThreeOptionViewController : QuestionViewController{
    
    @IBOutlet var firstButton: UIButton!
    @IBOutlet var secondButton: UIButton!
    @IBOutlet var thirdButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        firstButton?.setTitle(gameSession!.currentQuestion!.stringOptions![0], for: UIControl.State.normal)
        secondButton?.setTitle(gameSession!.currentQuestion!.stringOptions![1], for: UIControl.State.normal)
        thirdButton?.setTitle(gameSession!.currentQuestion!.stringOptions![2], for: UIControl.State.normal)
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
        default:
            assert(false, "Unknown sender")
        }
        
        gameSession!.responseIndex = buttonIndex
        self.returnToMain()
    }
}
