//
//  String+Util.swift
//  WikiTableMinerTool
//
//  Created by Cory Knapp on 5/7/19.
//  Copyright © 2019 Cory Knapp. All rights reserved.
//

import Foundation

extension String{
    public mutating func appendWithNewLine(_ string: String, indent: Int = 0) {
        self.append(String(repeating:"\t", count: indent))
        self.append(string)
        self.append("\n")
    }
    
   public mutating func strip(_ regEx: String) -> String{
        if let range = self.range(of: regEx, options: .regularExpression){
            self.replaceSubrange(range, with: "")
        }
        return self
    }
}
