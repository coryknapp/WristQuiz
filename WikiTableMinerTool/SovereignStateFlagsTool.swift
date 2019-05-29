//
//  SovereignStateFlagsTool.swift
//  WikiTableMinerTool
//
//  Created by Cory Knapp on 5/28/19.
//  Copyright © 2019 Cory Knapp. All rights reserved.
//

import Foundation
import SwiftSoup

func getSovereignStateFlags(){
    let wikiURL = "https://en.wikipedia.org/wiki/Gallery_of_sovereign_state_flags"
    
    var plistXMLString = """
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
    <array>
        <dict>
"""
    
    do {
        let htmlString = try String(contentsOf: URL(string: wikiURL)!, encoding: .utf8)
        
        let doc = try SwiftSoup.parse(htmlString)
        let galleryboxes = try doc.select(".gallerybox")
        for box in galleryboxes {
            plistXMLString.appendWithNewLine("<key>state</key>", indent: 3)
            plistXMLString.appendWithNewLine(try "<string>\(box.text())</string>", indent: 3)
            plistXMLString.appendWithNewLine("<key>image_id</key>", indent: 3)
            let imageURL = URL(string: "https:" + (try box.select("img").first()?.attr("src"))!)!
            plistXMLString.appendWithNewLine("<string>\(downloadFile(url: imageURL))</string>", indent: 3)
        }
        
    } catch let error {
        print("Error: \(error)")
    }
    
    plistXMLString.append("""
    </array>
</plist>
""")
    
    
}
