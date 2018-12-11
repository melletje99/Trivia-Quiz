//
//  questionData.swift
//  Trivia-Quiz
//
//  Created by Wessel Mel on 09/12/2018.
//  Copyright © 2018 Wessel Mel. All rights reserved.
//

import UIKit

struct Question: Codable {
    var category: String
    var type: String
    var difficulty: String
    var question: String
    var correct_answer: String
    var incorrect_answers: [String]
}

struct Questions: Codable {
    let results: [Question]
}
