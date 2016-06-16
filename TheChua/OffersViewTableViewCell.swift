//
//  OffersViewTableViewCell.swift
//  TheChua
//
//  Created by Hoang Dao on 3/21/16.
//  Copyright © 2016 Hoang Dao. All rights reserved.
//

import UIKit

class OffersViewTableViewCell: UITableViewCell {

    
    @IBOutlet weak var OfferName: UILabel!
    @IBOutlet weak var OfferImage: UIImageViewAsync!
    @IBOutlet weak var PayoutOffer: UILabel!
    
    @IBOutlet weak var ShareIcon: UIImageView!
    
    @IBOutlet weak var loadingActivity: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        OfferImage.layer.cornerRadius = 10
        OfferImage.layer.borderWidth = 0
        OfferImage.clipsToBounds = true        
        ShareIcon.layer.cornerRadius = ShareIcon.frame.size.height/2
        OfferImage.clipsToBounds = true
        
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
