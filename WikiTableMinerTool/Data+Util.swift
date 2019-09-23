//
//  Data+Util.swift
//  WikiTableMinerTool
//
//  Created by Cory Knapp on 5/28/19.
//  Copyright © 2019 Cory Knapp. All rights reserved.
//

import Foundation

// download a file to the data folder, and return the name under which it was written
func downloadFile(url: URL) -> String {
    let filename = UUID().uuidString + "." + url.pathExtension
    let destinationUrl = URL(string: resourceFolder + "/" + filename)!
    let dataFromURL = try! Data(contentsOf: url)
    try! dataFromURL.write(to: destinationUrl)
    return filename
}

func downloadImageWithSize(url: URL, resolution: CGSize) -> String {
    let filename = UUID().uuidString + "." + url.pathExtension
    let destinationUrl = URL(string: resourceFolder + "/" + filename)!
    let dataFromURL = try! Data(contentsOf: url)
    try! dataFromURL.write(to: destinationUrl)
    return filename
}
