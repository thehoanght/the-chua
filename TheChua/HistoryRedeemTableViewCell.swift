//
//  HistoryRedeemTableViewCell.swift
//  Thẻ Chùa
//
//  Created by Hoang Dao on 5/6/16.
//  Copyright © 2016 Hoang Dao. All rights reserved.
//

import UIKit

class HistoryRedeemTableViewCell: UITableViewCell {

    @IBOutlet weak var seri: UILabel!
    
    @IBOutlet weak var mathe: UILabel!
    
    @IBOutlet weak var created_at: UILabel!
    
    @IBOutlet weak var imageMethod: UIImageView!
    
    @IBOutlet weak var menhgia: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageMethod.layer.borderWidth = 1
        imageMethod.layer.borderColor = UIColor.clearColor().CGColor
        imageMethod.layer.cornerRadius = imageMethod.frame.size.height/2
        imageMethod.layer.masksToBounds = true
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
