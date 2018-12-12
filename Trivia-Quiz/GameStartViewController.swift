//
//  GameStartViewController.swift
//  Trivia-Quiz
//
//  Created by Wessel Mel on 09/12/2018.
//  Copyright © 2018 Wessel Mel. All rights reserved.
//

import UIKit

class GameStartViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    let fetchdata = fetchData()
    var x: [Question]?
    var results: [[String:Any]]?
    var url = "https://opentdb.com/api.php?amount=5"
    
    var categoryChosen: String = "Any"
    var questionTypeChosen: String = "Any"

    @IBOutlet weak var categoryPicker: UIPickerView!
    @IBOutlet weak var questionTypePicker: UIPickerView!
    @IBOutlet weak var startButton: UIButton!
    
    var categoryPickerData: [String] = [String]()
    var questionTypePickerData: [String] = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startButton.layer.cornerRadius = 5
        categoryPickerData = ["Any", "Sports", "Animals", "Vehicles", "History", "General Knowledge"]
        questionTypePickerData = ["Any", "Multiple Choice", "True or False"]
        self.categoryPicker.delegate = self
        self.questionTypePicker.delegate = self
        self.categoryPicker.dataSource = self
        self.questionTypePicker.dataSource = self
        fetchdata.fetchAnyAny(url) { (q1) in if let q2 = q1 {
                self.x = q2
            }
        }
        fetchdata.fetchResult{ (test) in
            if let test = test {
                self.results = test
            }
            let scoreVC = self.tabBarController?.viewControllers![1] as! UINavigationController
            let vc = scoreVC.topViewController as! scoreTableViewController
            vc.results = self.results
        }
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "startGame" {
            let inGameVC = segue.destination as! InGameViewController
            inGameVC.category = categoryChosen
            inGameVC.questionType = questionTypeChosen
            inGameVC.questions = self.x
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == categoryPicker {
            return categoryPickerData.count
        }
        else {
            return questionTypePickerData.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == categoryPicker {
            return categoryPickerData[row]
        }
        else {
            return questionTypePickerData[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == categoryPicker {
            categoryChosen = categoryPickerData[row]
        }
        else {
            questionTypeChosen = questionTypePickerData[row]
        }
        
        if categoryChosen == "Any" && questionTypeChosen == "Any"{
            url = "https://opentdb.com/api.php?amount=5"
        } else if categoryChosen == "Sports" && questionTypeChosen == "Any" {
            url = "https://opentdb.com/api.php?amount=5&category=21"
        } else if categoryChosen == "Animals" && questionTypeChosen == "Any" {
            url = "https://opentdb.com/api.php?amount=5&category=27"
        } else if categoryChosen == "Vehicles" && questionTypeChosen == "Any" {
            url = "https://opentdb.com/api.php?amount=5&category=28"
        } else if categoryChosen == "History" && questionTypeChosen == "Any" {
            url = "https://opentdb.com/api.php?amount=5&category=23"
        } else if categoryChosen == "General Knowledge" && questionTypeChosen == "Any" {
            url = "https://opentdb.com/api.php?amount=5&category=9"
        } else if categoryChosen == "Sports" && questionTypeChosen == "Multiple Choice" {
            url = "https://opentdb.com/api.php?amount=5&category=21&type=multiple"
        } else if categoryChosen == "Animals" && questionTypeChosen == "Multiple Choice" {
            url = "https://opentdb.com/api.php?amount=5&category=27&type=multiple"
        } else if categoryChosen == "Vehicles" && questionTypeChosen == "Multiple Choice" {
            url = "https://opentdb.com/api.php?amount=5&category=28&type=multiple"
        } else if categoryChosen == "History" && questionTypeChosen == "Multiple Choice" {
            url = "https://opentdb.com/api.php?amount=5&category=23&type=multiple"
        } else if categoryChosen == "General Knowledge" && questionTypeChosen == "Multiple Choice" {
            url = "https://opentdb.com/api.php?amount=5&category=9&type=multiple"
        } else if categoryChosen == "Sports" && questionTypeChosen == "True or False" {
            url = "https://opentdb.com/api.php?amount=5&category=21&type=boolean"
        } else if categoryChosen == "Animals" && questionTypeChosen == "True or False" {
            url = "https://opentdb.com/api.php?amount=5&category=27&type=boolean"
        } else if categoryChosen == "Vehicles" && questionTypeChosen == "True or False" {
            url = "https://opentdb.com/api.php?amount=5&category=28&type=boolean"
        } else if categoryChosen == "History" && questionTypeChosen == "True or False" {
            url = "https://opentdb.com/api.php?amount=5&category=23&type=boolean"
        } else if categoryChosen == "General Knowledge" && questionTypeChosen == "True or False" {
            url = "https://opentdb.com/api.php?amount=5&category=9&type=boolean"
        
        }
        fetchdata.fetchAnyAny(url) { (q1) in if let q2 = q1 {
            self.x = q2
            }
        }
    }
}
