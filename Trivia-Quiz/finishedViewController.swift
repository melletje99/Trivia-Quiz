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
    var stoppen = 0

    @IBOutlet weak var wonOrNot: UILabel!
    @IBOutlet weak var endResult: UITextView!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var highScores: UIButton!
    @IBOutlet weak var newGame: UIButton!
    @IBOutlet weak var enterYourNameLabel: UILabel!
    @IBOutlet weak var submitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if score! > 30 {
            wonOrNot.text = "You won :-)"
        } else {
            wonOrNot.text = "You lost :-("
        }

        endResult.text = "You have a score of \(score!) out of 50. You had \(answersTrue!) answer(s) true and \(answersWrong!) answer(s) wrong"
        
        nameField.isHidden = false
        enterYourNameLabel.isHidden = false
        submitButton.isHidden = false
        // Do any additional setup after loading the view.
    }
    
    @IBAction func submit(_ sender: Any) {
        name = nameField.text
        nameField.text = ""
        self.fetchdata.submitResults(name: self.name, score: self.score) { () }
        nameField.isHidden = true
        enterYourNameLabel.isHidden = true
        submitButton.isHidden = true
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "highScoresSegue" {
            let scoresTableNCVC = segue.destination as! UINavigationController
            let scoresTableVC = scoresTableNCVC.topViewController as! scoreTableViewController
            scoresTableVC.results = self.results
            scoresTableVC.via = 1
        }
        
        
    }
    
    
    

    @IBAction func newGame(_ sender: Any) {
        performSegue(withIdentifier: "newGameSegue", sender: newGame)
    }
    
    @IBAction func highScores(_ sender: Any) {
        self.fetchdata.fetchResult{ (test) in
            if let test = test {
                self.results = test
            }
        }
        while (self.stoppen == 0) {
            if self.results != nil {
                self.stoppen = 1
                performSegue(withIdentifier: "highScoresSegue", sender: highScores)
                break;
            }
        }
        
    }
}
