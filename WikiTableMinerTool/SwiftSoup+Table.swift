//
//  SwiftSoup+Table.swift
//  WikiTableMinerTool
//
//  Created by Cory Knapp on 5/3/19.
//  Copyright © 2019 Cory Knapp. All rights reserved.
//

import Foundation
import SwiftSoup

enum SwiftSoupTableError: Error {
    case unexpectedElementType
}

extension SwiftSoup.Element{
    // Get all tables from a document (or element)
    func tables() throws -> Elements{
        return try self.select("table")
    }
    
    // get header elements from table element
    func header() throws -> Elements{
        if(self.tag().getName() == "table"){
            throw SwiftSoupTableError.unexpectedElementType
        }
        return try self.select("th")
    }
    
//    func makeTableRowIterator() throws -> TableRowIterator{
//        assert(self.tag().getName() == "table")
//        return TableRowIterator(self)
//    }
    
//    struct TableRowIterator : IteratorProtocol{
//        typealias Element = SwiftSoup.Element
//        mutating func next() -> Element? {
//            let nextElem = internalIterator.next()
//            if(nextElem == nil){
//                return nil
//            }
//            //don't return header rows
//            if(try! nextElem!.select("th").array().count == 0){
//                return nextElem
//            }
//            return self.next()
//        }
//
//        var internalIterator: SwiftSoup.ElementsIterator
//        init(_ tableElement: Element) {
//            assert(tableElement.tag().getName() == "table")
//            internalIterator = try! tableElement.select("tr").makeIterator()
//        }
//    }
    
//    func makeTableCellIterator() throws -> TableCellIterator{
//        assert(self.tag().getName() == "tr")
//        return TableCellIterator(self)
//    }
//
//    struct TableCellIterator : IteratorProtocol{
//        typealias Element = SwiftSoup.Element
//        mutating func next() -> Element? {
//            let nextElem = internalIterator.next()
//            if(nextElem == nil){
//                return nil
//            }
//            //don't return header rows
////            if(try! nextElem!.select("th").array().count == 0){
//                return nextElem
//            }
//            return self.next()
//        }
//
//        var internalIterator: IndexingIterator<Element>
//        init(_ rowElement: Element) {
//            assert(rowElement.tag().getName() == "tr")
//            internalIterator = try! rowElement.select("td").makeIterator()
//        }
//    }
}
