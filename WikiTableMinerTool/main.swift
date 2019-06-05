//
//  main.swift
//  WikiTableMinerTool
//
//  Created by Cory Knapp on 5/1/19.
//  Copyright © 2019 Cory Knapp. All rights reserved.
//

import Foundation
import SwiftSoup

let resourceFolder = CommandLine.arguments[1]

print("writing to \"\(resourceFolder)\"")

FileManager().createDirectory(atPath: resourceFolder, withIntermediateDirectories: false)

print("building to president.plist")
try getPresidentData().write(to: URL(fileURLWithPath: resourceFolder).appendingPathComponent("presidents.plist"), atomically: true, encoding: .utf8)

print("building to sovereignstateflags.plist")
try getSovereignStateFlags().write(to: URL(fileURLWithPath: resourceFolder).appendingPathComponent("sovereignstateflags.plist"), atomically: true, encoding: .utf8)
