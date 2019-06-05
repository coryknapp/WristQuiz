//
//  SovereignStateFlagsCollection.swift
//  WristQuiz
//
//  Created by Cory Knapp on 5/29/19.
//  Copyright © 2019 Cory Knapp. All rights reserved.
//

import Foundation


import Foundation

class SovereignStateFlagsCollection: TriviaCollection {
    
    struct FlagEntry : Codable{
        var state: String
        var flagId: String
    }

    var enteries: Array<FlagEntry>!
    
    func getQuestion(difficulty: Int) -> TriviaQuestion{
        let question = TriviaQuestion()
        
        // pick flags randomly
        let options = enteries.randomElements(count: 3)!
        let (answerIndex, _) = options.randomElementAndIndex()
        //question.imageOptions = options.map{ $0.flagId }
        // question.question = "Who came first?"
        question.answerIndex = answerIndex!
        // question.failMessage = "\(question.options[question.answerIndex]) was the first of the three"
        return question
    }
    
    init() {
        loadDataFile()
    }
    
    func loadDataFile()
    {
        let path = Bundle.main.bundlePath + "/Data/presidents.plist"
        if let data = FileManager.default.contents(atPath: path)
        {
            enteries = try! PropertyListDecoder().decode(Array<FlagEntry>.self, from: data)
        }
    }
}
