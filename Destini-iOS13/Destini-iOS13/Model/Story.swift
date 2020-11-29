//
//  Sotry.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct Story {
    let stroyTitle: String
    let choice1: String
    let choice2: String
    let destination1: Int
    let destination2: Int
    
    
    init(title: String, choice1: String, choice1Destination: Int, choice2: String, choice2Destination: Int) {
        stroyTitle = title
        self.choice1 = choice1
        destination1 = choice1Destination
        self.choice2 = choice2
        destination2 = choice2Destination
    }
}
