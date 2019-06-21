//
//  InterfaceElement.swift
//  WristQuiz
//
//  Created by Cory Knapp on 6/11/19.
//  Copyright © 2019 Cory Knapp. All rights reserved.
//

import Foundation
import UIKit

// Used for buttons, labels that need to show text and/or an image

class InterfaceElement: UIButton {
    func setSuccessText(_ text: String){
        self.setAttributedTitle( NSAttributedString(string: text, attributes: [NSAttributedString.Key.font : Style.successFont, NSAttributedString.Key.foregroundColor: Style.successColor]), for: .normal)
    }
    
    func setFailText(_ text: String){
        self.setAttributedTitle( NSAttributedString(string: text, attributes: [NSAttributedString.Key.font : Style.failFont, NSAttributedString.Key.foregroundColor: Style.successColor]), for: .normal)
    }
}
