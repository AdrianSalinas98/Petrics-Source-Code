//
//  subclassCellTableViewCell.swift
//  PE Toolkit
//
//  Created by Adrian Salinas on 7/1/20.
//  Copyright © 2020 Adrian Salinas. All rights reserved.
//

import UIKit

class subclassCellTableViewCell: UITableViewCell {

    @IBOutlet weak var Title: UILabel!
    @IBOutlet weak var Body: UILabel!
    
    @IBOutlet weak var data: UILabel!
    @IBOutlet weak var ImagePreview: UIImageView!
    
    
}
extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}


