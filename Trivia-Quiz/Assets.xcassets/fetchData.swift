//
//  fetchData.swift
//  Trivia-Quiz
//
//  Created by Wessel Mel on 10/12/2018.
//  Copyright © 2018 Wessel Mel. All rights reserved.
//

import UIKit
import HTMLString



class fetchData {
    func fetchAnyAny(_ url: String, completion: @escaping ([Question]?) -> Void) {
        let testURL = URL(string: url)!
        let task = URLSession.shared.dataTask(with: testURL)
        { (data, response, error) in
            let jsonDecoder = JSONDecoder()
            if let data = data,
                let questions2 = try? jsonDecoder.decode(Questions.self, from: data) {
                completion(questions2.results)
            } else {
                completion(nil)
            }
            
        }
        task.resume()
    }
    
    func fetchResult(completion: @escaping ([[String:Any]]?) -> Void)
    {
        let url = URL(string: "http://127.0.0.1:5000/list")!
        let task = URLSession.shared.dataTask(with: url)
        { (data, response, error) in
            if let data = data,
                let test = try? JSONSerialization.jsonObject(with: data) as? [[String:Any]] {
                completion(test)
            } else {
                completion(nil)
            }
        }
        task.resume()
    }
    
    func submitResults(name: String?, score: Int?, completion: @escaping() -> ()) {
        let url = URL(string: "http://127.0.0.1:5000/list")!
        var request = URLRequest(url: url)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        let postString = "name=\(name!)&score=\(score!)"
        request.httpBody = postString.data(using: .utf8)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                return
            }
            
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
                completion()
            }
            
            let responseString = String(data: data, encoding: .utf8)
        }
        task.resume()
    }
    
    
}
