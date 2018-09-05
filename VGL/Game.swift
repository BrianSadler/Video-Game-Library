//
//  Game.swift
//  VGL
//
//  Created by Brian Sadler on 9/4/18.
//  Copyright © 2018 Brian Sadler. All rights reserved.
//

import Foundation
// data model that represents games that will be stored
class Game {
    var title: String // stores title
    var checkedIn = true // checked in by default
    var dueDate: Date? //If a game isnt checked out it will not have a due date
    init(title: String) {    //checkedIn has a default and dueDate is optional so only title is needed.
        self.title = title
    }
}
