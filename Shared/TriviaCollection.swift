//
//  TriviaCollection.swift
//  WristQuiz
//
//  Created by Cory Knapp on 4/9/19.
//  Copyright © 2019 Cory Knapp. All rights reserved.
//

import Foundation

#if os(iOS)
import UIKit
#endif

#if os(watchOS)
import WatchKit
#endif

public enum TriviaQuestionFormat{
    case ThreeOptionMutipleChoiceText
    case FourOptionMutipleChoiceImage
    case TwoOptionImage
}

public class TriviaQuestion{
    
    public typealias Image = UIImage
    
    public var stringQuestion: String?
    public var imageQuestion: Image?
    public var stringOptions: Array<String>?
    public var imageOptions: Array<Image>?
    public var failMessage: String?
    public var answerIndex: Int = 0
}

extension TriviaQuestion.Image{
    convenience init?(withId id: String){
        self.init(contentsOfFile: Bundle.main.bundlePath + "/Data/" + id)
    }
}

protocol TriviaCollection{
    func getQuestion(difficulty : Int) -> TriviaQuestion
}

