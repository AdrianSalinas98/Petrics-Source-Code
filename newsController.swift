//
//  newsController.swift
//  PE Toolkit
//
//  Created by Adrian Salinas on 6/30/20.
//  Copyright © 2020 Adrian Salinas. All rights reserved.
//

import UIKit

class newsController: UITableViewController{
    var petitions = [ser]()
    var imageCollection = [String]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
//        Do any additional setup after loading the view.
        
        
        let urlString = "https://newsapi.org/v2/everything?domains=rigzone.com&apiKey=c4b0acc19a1442aa8f16bcaaf0c3d118"
        if let url = URL(string: urlString){
            if let data = try? Data(contentsOf: url) {
//                ok to parse
                parse(json: data)
            }
        }
        func viewWillAppear(animated: Bool){
            super.viewWillAppear(animated)
        
        }
    }
    
    func parse(json: Data){
        let decoder = JSONDecoder()
        
        if let jsonPetitions = try? decoder.decode(Price.self, from: json){
            petitions = jsonPetitions.articles
            tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petitions.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 95
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! subclassCellTableViewCell
        let petition = petitions[indexPath.row]
        cell.Title.text = petition.title
        cell.Body.text = petition.description
        let s = petition.publishedAt
        let r = s.index(s.startIndex, offsetBy: 0)..<s.index(s.endIndex, offsetBy: -10)
        let ff = String(s[r])
        cell.data.text = ff
        let url = URL(string: "https://newsapi.org/v2/everything?domains=rigzone.com&apiKey=c4b0acc19a1442aa8f16bcaaf0c3d118")
        let U = URL(string: petition.urlToImage) ?? url
        let session = URLSession(configuration: .default)
        let downloadImage = session.dataTask(with: U!)
        { (data, response, error) in
            if let e = error {
                print("error in download\(e)")
            }
            else {
                if let res = response as? HTTPURLResponse {
                    print("downloaded\(res.statusCode)")
                    if let imageData = data{
                        let im = UIImage(data: imageData)
                        cell.ImagePreview.image = im
                    } else{
                        print("not loading?")
                    }
                }
            }
        }
        downloadImage.resume()
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = detailViewController()
        vc.detailItem = petitions[indexPath.row]
        //opens new view on tap
        navigationController?.pushViewController(vc, animated: true)
        tableView.reloadData()
    }
    
    }


