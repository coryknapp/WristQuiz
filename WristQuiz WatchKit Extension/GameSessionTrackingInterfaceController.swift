//
//  GameSessionTrackingInterfaceController.swift
//  WristQuiz WatchKit Extension
//
//  Created by Cory Knapp on 8/20/19.
//  Copyright © 2019 Cory Knapp. All rights reserved.
//

import Foundation
import WatchKit

class GameSessionTrackingViewController : WKInterfaceController {
    var gameSession : GameSession?
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        // Configure interface objects here.
        if( context != nil){
            gameSession = (context as! GameSession);
        }
    }
    
    func displayResult(){
        WKInterfaceController.reloadRootControllers(withNamesAndContexts: [(name: "MainInterfaceController", context: gameSession!)])
    }
}
