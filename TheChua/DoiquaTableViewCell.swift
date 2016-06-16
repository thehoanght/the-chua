//
//  DoiquaTableViewCell.swift
//  Thẻ Chùa
//
//  Created by Hoang Dao on 3/23/16.
//  Copyright © 2016 Hoang Dao. All rights reserved.
//

import UIKit

class DoiquaTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var view: UIView!
    
    
    @IBOutlet weak var imageThe: UIImageView!

    @IBOutlet weak var menhgia: UILabel!
    
    
    @IBOutlet weak var giaxu: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        view.layer.cornerRadius = 5
        imageThe.layer.cornerRadius = 5
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
