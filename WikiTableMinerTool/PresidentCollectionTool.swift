////
////  PresidentCollectionTool.swift
////  WikiTableMinerTool
////
////  Created by Cory Knapp on 5/28/19.
////  Copyright © 2019 Cory Knapp. All rights reserved.
////
//
//import Foundation
//import SwiftSoup
//
//func getPresidentData() throws -> String{
//    // Get the raw html from wikipedia
//    let wikiURL = "https://en.wikipedia.org/wiki/List_of_Presidents_of_the_United_States" //CommandLine.arguments[1]
//
//    let presInstruct = TableMinerInstructions(
//        url: URL(string: wikiURL)!,
//        tableIndex: 1,
//        colIndexToPlistKey: [
//            TableMinerInstructions.textOnlyParser(plistKey: "number", plistValueType: "integer"),
//            TableMinerInstructions.stripAnnotations(plistKey: "dates"),
//            nil, // portrait
//            {
//                // includes name and birth/death year
//                var text = try! $0.select("big").text()
//                // also, living presidents have " Born" included in that <big> tag
//                // so we have to strip it
//                _ = text.strip(" Born$")
//    
//                return [("name", "string", text)]
//            },
//            nil,// prior office
//            nil,// party color field
//            TableMinerInstructions.textOnlyParser(plistKey: "party"),
//            TableMinerInstructions.textOnlyParser(plistKey: "election_year"),
//            TableMinerInstructions.stripAnnotations(plistKey: "vp"),
//            ]
//    )
//
//    do {
//        let htmlString = try String(contentsOf: URL(string: wikiURL)!, encoding: .utf8)
//        return try TableMiner.generatePlist(html: htmlString, instructions: presInstruct)
//    } catch let error {
//        print("Error: \(error)")
//        throw error
//    }
//}
