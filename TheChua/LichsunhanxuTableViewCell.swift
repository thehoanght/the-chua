//
//  LichsunhanxuTableViewCell.swift
//  Thẻ Chùa
//
//  Created by Hoang Dao on 5/5/16.
//  Copyright © 2016 Hoang Dao. All rights reserved.
//

import UIKit

class LichsunhanxuTableViewCell: UITableViewCell {

    @IBOutlet weak var content: UILabel!
    
    @IBOutlet weak var created_at: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
