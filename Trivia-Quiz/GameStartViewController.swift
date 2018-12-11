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
        fetchdata.fetchAnyAny { (q1) in if let q2 = q1 {
                self.x = q2
                print(self.x)
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
    }

    func printdata() {
        print(self.x!)
    }
}
