//
//  Data+Util.swift
//  WikiTableMinerTool
//
//  Created by Cory Knapp on 5/28/19.
//  Copyright © 2019 Cory Knapp. All rights reserved.
//

import Foundation

func downloadFile(url: URL) -> String {
    let uuidString = UUID().uuidString
    let destinationUrl = URL(string: resourceFolder + "/" + uuidString)!
    let dataFromURL = try! Data(contentsOf: url)
    try! dataFromURL.write(to: destinationUrl)
    return uuidString
}
