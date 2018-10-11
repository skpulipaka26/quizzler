//
//  Question.swift
//  Quizzler
//
//  Created by Pulipaka Sai Krishna on 10/10/18.
//  Copyright © 2018 skpulipaka.com. All rights reserved.
//

import Foundation

class Question {
    
    let questionText: String
    let answer: Bool
    
    // the init is similar to constructor in javascript / typescript
    init(text: String, correctAnswer: Bool) {
        questionText = text
        answer = correctAnswer
    }
    
}
