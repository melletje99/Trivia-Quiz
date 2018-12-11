//
//  scoreViewController.swift
//  Trivia-Quiz
//
//  Created by Wessel Mel on 11/12/2018.
//  Copyright © 2018 Wessel Mel. All rights reserved.
//

import UIKit

class scoreTableViewController: UITableViewController {
    var results: [[String:Any]]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    //
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.results!.count
    }
    //
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "scoreCell", for: indexPath)
        configure(cell, forItemAt: indexPath)
        return cell
    }
    //
    func configure(_ cell: UITableViewCell, forItemAt indexPath: IndexPath) {
        let item = self.results![indexPath.row]
        cell.textLabel?.text = item["name"] as? String
        cell.detailTextLabel?.text = item["score"] as? String
        
    }
    


}