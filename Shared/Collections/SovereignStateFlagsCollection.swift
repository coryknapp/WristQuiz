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
        //let options = enteries.randomElements(count: 3)!
        //let (answerIndex, answer) = options.randomElementAndIndex()
        // question.options = options.map{ $0.name }
        // question.question = "Who came first?"
        // question.answerIndex = options.indexOfMax(by: {a, b in a.number < b.number})!
        // question.failMessage = "\(question.options[question.answerIndex]) was the first of the three"
        return question
    }
    
    init() {
        loadDataFile()
    }
    
    func loadDataFile()
    {
        if let path = Bundle.main.path(forResource: "sovereignstateflags", ofType: "plist"),
            let data = FileManager.default.contents(atPath: path)
        {
            enteries = try! PropertyListDecoder().decode(Array<FlagEntry>.self, from: data)
        }
    }
}
