//
//  Util.swift
//  WristQuiz WatchKit Extension
//
//  Created by Cory Knapp on 4/19/19.
//  Copyright © 2019 Cory Knapp. All rights reserved.
//

import Foundation

#if os(iOS)
import UIKit
#endif

#if os(watchOS)
import WatchKit
#endif

extension Array {
    
    //Random selection
    func randomElement() -> Element? {
        if isEmpty { return nil }
        let index = Int(arc4random_uniform(UInt32(self.count)))
        return self[index]
    }
    
    func randomElementAndIndex() -> (Int?, Element?){
        if isEmpty { return (nil, nil) }
        let index = Int(arc4random_uniform(UInt32(self.count)))
        return (index, self[index])
    }
    
    func randomConsecutiveElements(count: Int) -> ArraySlice<Element>?{
        if self.count < count { return nil }
        let index = Int(arc4random_uniform(UInt32(self.count-count)))
        return self[index...(index+count-1)]
    }
    
    func shuffledRandomConsecutiveElements(count: Int) -> Array?{
        return Array<Element>(randomConsecutiveElements(count: count)!).shuffled()
    }

    func randomElements(count: Int) -> Array? {
        if self.count < count { return nil }
        var copy = Array<Element>(self)
        var returnArray = Array<Element>()
        for _ in 0...count-1{
            let (i, e) = copy.randomElementAndIndex()
            copy.remove(at: i!)
            returnArray.append(e!)
        }
        return returnArray
    }

    // Other
    func indexOfMax(by areInIncreasingOrder: (Element, Element) throws -> Bool) rethrows -> Int?{
        var best = self.first!
        var bestIndex = 0
        for (index, element) in self.enumerated(){
            if try areInIncreasingOrder(element, best){
                best = element
                bestIndex = index
            }
        }
        return bestIndex
    }
}

extension Array where Element: Equatable{
    func containsRepeatedElement() -> Bool{
        //O(n^2) but we're using really small arrays in this, typically less then
        //4 elements.  Candidate for future improvement.
        for (index1, element1) in self.enumerated(){
            for (index2, element2) in self.enumerated(){
                if( index1 != index2 && element1 == element2){
                    return true
                }
            }
        }
        return false
    }
}
