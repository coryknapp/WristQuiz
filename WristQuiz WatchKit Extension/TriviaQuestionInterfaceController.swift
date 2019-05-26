//
//  TriviaQuestionInterfaceController.swift
//  WristQuiz WatchKit Extension
//
//  Created by Cory Knapp on 4/18/19.
//  Copyright © 2019 Cory Knapp. All rights reserved.
//

import WatchKit
import Foundation


class TriviaQuestionInterfaceController: WKInterfaceController {

    var gameSession : GameSession?
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        // Configure interface objects here.
        
        gameSession = (context as! GameSession);
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    func displayResult(){
        WKInterfaceController.reloadRootControllers(withNamesAndContexts: [(name: "MainInterfaceController", context: gameSession!)])
    }
}
