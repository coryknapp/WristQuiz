//
//  PresidentCollection.swift
//  WristQuiz
//
//  Created by Cory Knapp on 4/9/19.
//  Copyright © 2019 Cory Knapp. All rights reserved.
//

import Foundation

class PresidentCollection: TriviaCollection {
    
    struct PresidentEntry : Codable{
        var name: String
        var number: Int
        var party: String
        var vp: String
    }
    
    enum ThreeOptionMutipleChoiceTextTypes : Int {
        //Order questions
        case whoCameFirst
        case whoCameLast
        case numberToName
        case nameToNumber //if another case is added, be sure to update random()
        
        //XXX is this range inclusive?
        static func random() -> ThreeOptionMutipleChoiceTextTypes{
            return ThreeOptionMutipleChoiceTextTypes(rawValue: Int.random(in: 0...PresidentCollection.ThreeOptionMutipleChoiceTextTypes.nameToNumber.rawValue))!
        }
    }
    
    var enteries: Array<PresidentEntry>!
    
    func getQuestion(difficulty: Int) -> TriviaQuestion{
        
        //randomly select a class of question
        //(we only know how to do one type now)
        let questionType = TriviaQuestionFormat.ThreeOptionMutipleChoiceText
        
        return getQuestionForFormat(difficulty: difficulty, format: questionType)
    }
    
    func getQuestionForFormat(difficulty: Int, format: TriviaQuestionFormat) -> TriviaQuestion{
        //if(format == TriviaQuestionFormat.ThreeOptionMutipleChoiceText){
            return getQuestionForThreeOptionMutipleChoiceTextFormat()
        //}
    }
    
    func getQuestionForThreeOptionMutipleChoiceTextFormat() -> TriviaQuestion{
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .ordinal
        
        let subFormat = ThreeOptionMutipleChoiceTextTypes.random()
        let options = enteries.shuffledRandomConsecutiveElements(count: 3)!
        // pick three unique preses
        let question = TriviaQuestion(type: TriviaQuestionFormat.ThreeOptionMutipleChoiceText)
        switch subFormat {
        case .whoCameFirst:
            question.options = options.map{ $0.name }
            question.question = "Who came first?"
            question.answerIndex = options.indexOfMax(by: {a, b in a.number < b.number})!
            question.failMessage = "\(question.options[question.answerIndex]) was the first of the three"
        case .whoCameLast:
            question.options = options.map{ $0.name }
            question.question = "Who came last?"
            question.answerIndex = options.indexOfMax(by: {a, b in a.number > b.number})!
            question.failMessage = "\(question.options[question.answerIndex]) was the last of the three"
        case .numberToName:
            question.options = options.map{ $0.name }
            let (index, answer) = options.randomElementAndIndex()
            question.question = "Who was number \(answer!.number)?"
            question.answerIndex = index!
            question.failMessage = "\(question.options[question.answerIndex]) was the \(formatter.string(from:NSNumber(value: answer!.number))!) president"
        case .nameToNumber:
            question.options = options.map{ String($0.number) }
            let (index, answer) = options.randomElementAndIndex()
            question.question = "What was \(answer!.name)'s number?"
            question.answerIndex = index!
            question.failMessage = "\(question.options[question.answerIndex]) was the \(formatter.string(from:NSNumber(value: answer!.number))!) president"
        //default:
        //    question.question = "error"
        }
        
        return question
    }
    

    init() {
        loadDataFile()
    }
    
    func loadDataFile()
    {
        if let path = Bundle.main.path(forResource: "presidents", ofType: "plist"),
            let data = FileManager.default.contents(atPath: path)
        {
            enteries = try! PropertyListDecoder().decode(Array<PresidentEntry>.self, from: data)
        }
    }
}
