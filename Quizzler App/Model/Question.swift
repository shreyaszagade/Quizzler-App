//
//  Question.swift
//  Quizzler App
//
//  Created by Shreyas Zagade on 3/11/18.
//  Copyright © 2018 Shreyas Zagade. All rights reserved.
//

import Foundation

class Question{
    
    let questionText : String
    let correctAnswer : Bool
    
    init(text : String, correctAnswer : Bool) {
        questionText = text
        self.correctAnswer = correctAnswer
    }
    
}
