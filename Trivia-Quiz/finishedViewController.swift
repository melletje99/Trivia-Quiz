//
//  finishedViewController.swift
//  Trivia-Quiz
//
//  Created by Wessel Mel on 10/12/2018.
//  Copyright © 2018 Wessel Mel. All rights reserved.
//

import UIKit

class finishedViewController: UIViewController {
    let fetchdata = fetchData()
    var score: Int?
    var answersWrong: Int?
    var answersTrue: Int?
    var name: String?
    var results: [[String:Any]]?

    @IBOutlet weak var wonOrNot: UILabel!
    @IBOutlet weak var endResult: UITextView!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var highScores: UIButton!
    @IBOutlet weak var newGame: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if score! > 30 {
            wonOrNot.text = "You won :-)"
        } else {
            wonOrNot.text = "You lost :-("
        }

        endResult.text = "You have a score of \(score!) out of 50. You had \(answersTrue!) answer(s) true and \(answersWrong!) answer(s) wrong"
        
        // Do any additional setup after loading the view.
    }
    @IBAction func submit(_ sender: Any) {
        name = nameField.text
        DispatchQueue.main.async() {
            self.fetchdata.submitResults(name: self.name, score: self.score)
            self.fetchdata.fetchResult{ (test) in
                if let test = test {
                    self.results = test
                }
            }
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let scoresTableVC = segue.destination as! scoreTableViewController
        scoresTableVC.results = self.results
        
    }
    
    
    

    @IBAction func newGame(_ sender: Any) {
        
    }
    
    @IBAction func highScores(_ sender: Any) {
        performSegue(withIdentifier: "highScoresSegue", sender: highScores)
    }
}
