//
//  TriviaCollection.swift
//  WristQuiz
//
//  Created by Cory Knapp on 4/9/19.
//  Copyright © 2019 Cory Knapp. All rights reserved.
//

import Foundation

public enum TriviaQuestionFormat {
    case ThreeOptionMutipleChoiceText
    //case ThreeOptionMutipleChoiceImage
    //case TwoOptionImage
}

public class TriviaQuestion{
    public var type: TriviaQuestionFormat
    public var question: String = ""
    public var options: Array<String> = []
    public var failMessage: String = ""
    public var answerIndex: Int = 0
    
    init(type: TriviaQuestionFormat) {
        self.type = type
    }
}

protocol TriviaCollection{
    func getQuestion(difficulty : Int) -> TriviaQuestion
}
