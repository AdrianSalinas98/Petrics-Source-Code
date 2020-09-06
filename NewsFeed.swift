//
//  NewsFeed.swift
//  PE Toolkit
//
//  Created by Adrian Salinas on 7/14/20.
//  Copyright © 2020 Adrian Salinas. All rights reserved.
// ad unit ID: ca-app-pub-4761213067746899/8739514150

import Foundation
import UIKit
import GoogleMobileAds

class NewsFeed: UIViewController {
    var petitions = [ser]()
    var imageCollection = [String]()
    

    @IBOutlet weak var tableVIEW: UITableView!
    
    @IBOutlet weak var newsBannerView: GADBannerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableVIEW.delegate = self
        tableVIEW.dataSource = self
        
        newsBannerView.delegate = self
        
        newsBannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
//        real id vvv
//        newsBannerView.adUnitID = "ca-app-pub-9327866905939676/1382191904"
        newsBannerView.rootViewController = self
        newsBannerView.load(GADRequest())
        
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
        
        if let jsonPetitions = try?
            decoder.decode(Price.self, from: json){
            petitions = jsonPetitions.articles
            print(petitions)
            tableVIEW.reloadData()
        }
    }
    
        
        
    }
    
extension NewsFeed: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petitions.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 95
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        let petition = petitions[indexPath.row]
        cell.Top.text = petition.title
        cell.Bottom.text = petition.description
        let s = petition.publishedAt
        let r = s.index(s.startIndex, offsetBy: 0)..<s.index(s.endIndex, offsetBy: -10)
        let ff = String(s[r])
        cell.topDate.text = ff
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
                        DispatchQueue.main.async {
                        cell.pic.image = im
                        cell.pic.layer.cornerRadius = 15
                        }
                    } else{
                        print("not loading?")
                    }
                }
            }
        }
        downloadImage.resume()
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = detailViewController()
            vc.detailItem = petitions[indexPath.row]
            //opens new view on tap
            navigationController?.pushViewController(vc, animated: true)
            tableVIEW.reloadData()
        }
    }
    
    
extension UIViewController {
    public func newsBannerView(_ bannerView: GADBannerView) {
        print("recieved ad")
    }
    
    public func newsBannerView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: GADRequestError) {
        print(error)
    }
}
    

