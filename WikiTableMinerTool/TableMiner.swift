//
//  TableMiner.swift
//  WikiTableMinerTool
//
//  Created by Cory Knapp on 5/3/19.
//  Copyright © 2019 Cory Knapp. All rights reserved.
//

import Foundation
import SwiftSoup

// XXX bad name?
struct TableMinerInstructions{
    typealias ColIndexToPlistKeyClosure = (Element) throws -> [(String, String, String)]
    
    var url: URL
    var tableIndex: Int // 0 starting index of the tables location in the wiki page
    
    // each entry in colIndexToPlistKey takes SwiftSoup.Element and
    // returns a (key, value type, value) tuple
    var colIndexToPlistKey: [(ColIndexToPlistKeyClosure)?]
    
    static func textOnlyParser(plistKey: String, plistValueType: String = "string") -> ColIndexToPlistKeyClosure{
        return {
            return [(plistKey, plistValueType, try $0.text())]
        }
    }
    
    static func stripAnnotations(plistKey: String, plistValueType: String = "string") -> ColIndexToPlistKeyClosure{
        return {
            var text = try $0.text()
            return [(plistKey, plistValueType, text.strip("\\[.\\]"))]
        }
    }
}

class TableMiner {
    static func generatePlist(html: String, instructions: TableMinerInstructions) throws{
        let doc = try SwiftSoup.parse(html)
        let tableElem = try doc.tables().get(instructions.tableIndex)
        var rowIterator = try tableElem.makeTableRowIterator()
        
        var plistString = ""
        
        while let row = rowIterator.next(){
            var bailFlag = false
            var plistEntry = ""
            var cellIterator = try row.makeTableCellIterator()
            for parser in instructions.colIndexToPlistKey{
                if let nextCell = cellIterator.next(){
                    if(parser != nil){
                        if let keyValuePairs = try? parser!(nextCell){
                            for (key, valueType, value) in keyValuePairs{
                                plistEntry.appendWithNewLine("<key>\(key)</key>", indent: 3)
                                plistEntry.appendWithNewLine("<\(valueType)>\(value)</\(valueType)>", indent: 3)
                            }
                        }
                    }
                }else{
                    // something messed up.  This is expected because wiki sometimes does goof stuff with the tables
                    bailFlag = true
                    break
                }
            }
            if(!bailFlag){
                plistString.appendWithNewLine("<dict>", indent:2)
                plistString.appendWithNewLine(plistEntry)
                plistString.appendWithNewLine("</dict>", indent:2)
            }
        }
        
        print(plistString)
    }
}
