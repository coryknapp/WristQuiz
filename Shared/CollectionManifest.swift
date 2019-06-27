//
//  CollectionManifest.swift
//  WristQuiz
//
//  Created by Cory Knapp on 6/23/19.
//  Copyright © 2019 Cory Knapp. All rights reserved.
//

import Foundation

class Shared {
    static var CollectionManifest: [(name: String, description: String, factory: () -> TriviaCollection)] = [
        (name: "U.S. Presidents", description: "test", factory: PresidentCollection.init ),
        (name: "Sovereign State Flags", description: "test2", factory: SovereignStateFlagsCollection.init ),
    ]
}
