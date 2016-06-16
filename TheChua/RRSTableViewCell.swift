//
//  RRSTableViewCell.swift
//  Thẻ Chùa
//
//  Created by Hoang Dao on 6/9/16.
//  Copyright © 2016 Hoang Dao. All rights reserved.
//

import UIKit

class RRSTableViewCell: UITableViewCell {

    
    @IBOutlet weak var viewInContentView: UIView!
    
    
    @IBOutlet weak var imageLogo: UIImageView!
    
    @IBOutlet weak var nameOffer: UILabel!
    
    @IBOutlet weak var openButton: UIButton!
    
    @IBOutlet weak var pointRRS: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code        
        viewInContentView.layer.cornerRadius = 9
        imageLogo.layer.cornerRadius = 9
        imageLogo.layer.masksToBounds = true
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
