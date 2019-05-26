//
//  GameSession.swift
//  WristQuiz
//
//  Created by Cory Knapp on 5/24/19.
//  Copyright © 2019 Cory Knapp. All rights reserved.
//

import Foundation

class GameSession {
    
    // MARK: - Options
    
    // general game options
    var questionTimeLimit = 0 // in seconds
    var wrongLimit = 3 // How many can you get wrong before lose condition
    
    // victory conditions
    var goalQuestionCount = 25
    
    // MARK: - Session values
    var triviaCollection : TriviaCollection?
    
    var currentQuestion : TriviaQuestion?
    var responseIndex : Int?
    
    var numQuestionsAnsweredCorrect = 0
    var numQuestionsAnsweredWrong = 0
    var numQuestionsAsked : Int{
        get{ return numQuestionsAnsweredCorrect + numQuestionsAnsweredWrong }
    }
    
    // returns true if the player beefed it
    var failed : Bool{
        get{ return numQuestionsAnsweredCorrect > goalQuestionCount }
    }
    
    // returns true if the player's won the session
    var completed : Bool{
        get{ return numQuestionsAnsweredWrong > wrongLimit }
    }
    
    func prepareNewQuestion() {
        assert(triviaCollection != nil)
        currentQuestion = triviaCollection?.getQuestion(difficulty: 0)
        responseIndex = nil
    }
    
    func submitAnswer(_ answerIndex: Int) -> Result{
        if answerIndex == currentQuestion?.answerIndex{
            numQuestionsAnsweredCorrect += 1
            return .right
        }else{
            numQuestionsAnsweredWrong += 1
            return .wrong
        }
    }
    
    enum Result {
        case right
        case wrong
    }
}
