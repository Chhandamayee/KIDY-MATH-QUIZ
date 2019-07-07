//
//  QuizClass.swift
//  KIDY MATH QUIZ
//
//  Created by chhandamayee samal on 06/07/19.
//  Copyright © 2019 digilaytech. All rights reserved.
//

import Foundation
class Quiz {
    var id: Int
    var question: String = ""
    var answer: String = ""
    
    init(id: Int, question: String, answer: String) {
        self.id = id
        self.question = question
        self.answer = answer
    }
}
