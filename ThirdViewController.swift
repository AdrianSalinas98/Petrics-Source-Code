//
//  ThirdViewController.swift
//  PE Toolkit
//
//  Created by Adrian Salinas on 6/29/20.
//  Copyright © 2020 Adrian Salinas. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var testBox: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        Do any additional setup after loading the view.
        
        testBox.delegate = self
    }

    @IBAction func TestButton(_ sender: UIButton) {
        //        hit the APIendpoint
                let urlString = "https://newsapi.org/v2/everything?domains=rigzone.com&apiKey=c4b0acc19a1442aa8f16bcaaf0c3d118"
                let url = URL(string: urlString)
                guard url != nil else{
                    return
            
                }
                let session = URLSession.shared
                let dataTask = session.dataTask(with: url!) {(data, response,error) in
        //            check for errors
                    if error == nil && data != nil{
        //                parse JSON
                        let decoder = JSONDecoder()
                        do {
                            let newsFeed = try decoder.decode(Price.self, from: data!)
                            print(newsFeed)
                    }
                        catch {
                            print("Error in JSON Parsing")
                        }
                    }
                }
        //        make the API Call
                dataTask.resume()
        
    }
    
    
}
