//
//  TableViewCell.swift
//  PE Toolkit
//
//  Created by Adrian Salinas on 7/14/20.
//  Copyright © 2020 Adrian Salinas. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var Head: UILabel!
    @IBOutlet weak var Foot: UILabel!
    
    @IBOutlet weak var PostDate: UILabel!
    @IBOutlet weak var box: UIImageView!
    
    @IBOutlet weak var Top: UILabel!
    @IBOutlet weak var Bottom: UILabel!
    
    @IBOutlet weak var topDate: UILabel!
    @IBOutlet weak var pic: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
extension UIImageView {
    func Newload(url: URL) {
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
