//
//  TableViewCell.swift
//  Thẻ Chùa
//
//  Created by Hoang Dao on 5/24/16.
//  Copyright © 2016 Hoang Dao. All rights reserved.
//

import UIKit

class SukienTableViewCell: UITableViewCell {

    @IBOutlet weak var tensukien: UILabel!
    
    @IBOutlet weak var noidung: UILabel!
    
    @IBOutlet weak var hinhanh: UIImageView!
    
    @IBOutlet weak var view: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        view.layer.cornerRadius = 5
        hinhanh.layer.cornerRadius = hinhanh.frame.size.height/2
        hinhanh.layer.borderWidth = 1
        hinhanh.layer.borderColor = UIColor.whiteColor().CGColor
        hinhanh.clipsToBounds = true
        hinhanh.backgroundColor = UIColor(patternImage: UIImage(named: "NoImageAvailable")!)

    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
