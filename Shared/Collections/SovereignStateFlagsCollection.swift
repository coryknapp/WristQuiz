//
//  SovereignStateFlagsCollection.swift
//  WristQuiz
//
//  Created by Cory Knapp on 5/29/19.
//  Copyright © 2019 Cory Knapp. All rights reserved.
//

import Foundation

#if os(iOS)
import UIKit
#endif

#if os(watchOS)
import WatchKit
#endif

class SovereignStateFlagsCollection: TriviaCollection {
    
    struct FlagEntry : Codable{
        var state: String
        var image_id: String
    }

    var enteries: Array<FlagEntry>!
    
    func getQuestion(difficulty: Int) -> TriviaQuestion{
        let question = TriviaQuestion()
        
        // pick flags randomly
        let options = enteries.randomElements(count: 4)!
        let (answerIndex, answerEntity) = options.randomElementAndIndex()
        question.imageOptions = options.map{ TriviaQuestion.Image(withId: $0.image_id) }
        question.stringQuestion = "\(answerEntity?.state ?? "SOMETHING WENT WRONG")?"
        question.answerIndex = answerIndex!
        question.failMessage = "Wrong" // TODO more useful message
        return question
    }
    
    init() {
        loadDataFile()
    }
    
    func loadDataFile()
    {
        let path = Bundle.main.bundlePath + "/Data/sovereignstateflags.plist"
        if let data = FileManager.default.contents(atPath: path)
        {
            enteries = try! PropertyListDecoder().decode(Array<FlagEntry>.self, from: data)
        }
    }
}
