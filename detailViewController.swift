//
//  detailViewController.swift
//  PE Toolkit
//
//  Created by Adrian Salinas on 6/30/20.
//  Copyright © 2020 Adrian Salinas. All rights reserved.
//

import UIKit
import WebKit
import SafariServices

class detailViewController: UIViewController {
    var webView: WKWebView!
    var detailItem: ser?

    override func loadView(){
        webView = WKWebView()
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let url = URL(string: detailItem!.url){
            let vc = SFSafariViewController(url:url)
            present(vc, animated: true)
            
    }

}
}
