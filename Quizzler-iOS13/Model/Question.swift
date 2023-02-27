//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Fauzan Dwi Prasetyo on 26/02/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let question: String
    let answers: [String]
    let correctAnswer: String
    
    init(q: String, a: [String], correctAnswer: String) {
        question = q
        answers = a
        self.correctAnswer = correctAnswer
    }
}
