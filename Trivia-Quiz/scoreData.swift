//
//  scoreData.swift
//  Trivia-Quiz
//
//  Created by Wessel Mel on 11/12/2018.
//  Copyright © 2018 Wessel Mel. All rights reserved.
//

import UIKit

struct Score: Codable {
    var id: Int
    var name: String
    var score: String
}

struct Scores: Codable {
    let scores: [Score]
}
