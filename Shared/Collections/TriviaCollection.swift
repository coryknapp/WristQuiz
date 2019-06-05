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
    
    #if os(iOS)
    public typealias Image = UIImage
    #endif
    
    #if os(watchOS)
    public typealias Image = WKInterfaceImage
    #endif
    
    public var stringQuestion: String?
    public var imageQuestion: Image?
    public var stringOptions: Array<String>?
    public var imageOptions: Array<Image>?
    public var failMessage: String?
    public var answerIndex: Int = 0
}

protocol TriviaCollection{
    func getQuestion(difficulty : Int) -> TriviaQuestion
}
