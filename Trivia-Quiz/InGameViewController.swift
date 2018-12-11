//
//  InGameViewController.swift
//  Trivia-Quiz
//
//  Created by Wessel Mel on 09/12/2018.
//  Copyright © 2018 Wessel Mel. All rights reserved.
//

import UIKit

class InGameViewController: UIViewController {
    var category: String = ""
    var questionType: String = ""
    var questions: [Question]?
    var answerList = [String]()
    var i = 0
    var score = 0
    var answersTrue = 0
    var answerWrong = 0

    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    @IBOutlet weak var answer4: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        game()
        print(questions!)
        print(questions!.count)
        // Do any additional setup after loading the view.
    }
    
    func game() {
        answerList.append(questions![i].correct_answer.removingHTMLEntities)
        for q in questions![i].incorrect_answers {
            answerList.append(q.removingHTMLEntities)
        }
        category = questions![i].category.removingHTMLEntities
        categoryLabel.text = "Category: \(category)"
        questionLabel.text = questions![i].question.removingHTMLEntities
        if questions![i].type == "multiple" {
            answer1.isHidden = false
            answer4.isHidden = false
            answerList.shuffle()
            answer1.setTitle(answerList[0], for: .normal)
            answer2.setTitle(answerList[1], for: .normal)
            answer3.setTitle(answerList[2], for: .normal)
            answer4.setTitle(answerList[3], for: .normal)
        } else {
            answer1.isHidden = true
            answer4.isHidden = true
            answer2.setTitle("True", for: .normal)
            answer3.setTitle("False", for: .normal)
        }
    }
    
    @IBAction func answer1Action(_ sender: Any) {
        print(answer1.title(for: .normal)!)
        print(questions![i].correct_answer)
        if answer1.title(for: .normal) == questions![i].correct_answer {
            score += 10
            answersTrue += 1
        } else {
            answerWrong += 1
        }
        answerList.removeAll()
        i += 1
        if i > (questions!.count - 1) {
            performSegue(withIdentifier: "gameFinished", sender: answer1)
        } else {
            game()
        }
    }
    
    @IBAction func answer2Action(_ sender: Any) {
        print("2")
        print(answer2.title(for: .normal)!)
        print(questions![i].correct_answer)
        if answer2.title(for: .normal) == questions![i].correct_answer {
            score += 10
            answersTrue += 1
        } else {
            answerWrong += 1
        }
        answerList.removeAll()
        i += 1
        if i > (questions!.count - 1) {
            performSegue(withIdentifier: "gameFinished", sender: answer2)
        } else {
            game()
        }
    }
    @IBAction func answer3Action(_ sender: Any) {
        print("3")
        print(answer3.title(for: .normal)!)
        print(questions![i].correct_answer)
        if answer3.title(for: .normal) == questions![i].correct_answer {
            score += 10
            answersTrue += 1
        } else {
            answerWrong += 1
        }
        answerList.removeAll()
        i += 1
        if i > (questions!.count - 1) {
            performSegue(withIdentifier: "gameFinished", sender: answer3)
        } else {
            game()
        }
    }
    @IBAction func answer4Action(_ sender: Any) {
        print(answer4.title(for: .normal)!)
        print(questions![i].correct_answer)
        if answer4.title(for: .normal) == questions![i].correct_answer {
            score += 10
            answersTrue += 1
        } else {
            answerWrong += 1
        }
        answerList.removeAll()
        i += 1
        if i > (questions!.count - 1) {
            performSegue(withIdentifier: "gameFinished", sender: answer4)
        } else {
            game()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gameFinished" {
            let finishedVC = segue.destination as! finishedViewController
            finishedVC.score = score
            finishedVC.answersTrue = answersTrue
            finishedVC.answersWrong = answerWrong
        }
    }
    
}
