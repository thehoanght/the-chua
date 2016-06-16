//
//  ProfileTableViewHeaderFooterView.swift
//  TheChua
//
//  Created by Hoang Dao on 3/21/16.
//  Copyright © 2016 Hoang Dao. All rights reserved.
//

import UIKit

class ProfileTableViewHeaderFooterView: UITableViewHeaderFooterView {

    @IBOutlet weak var ContentView: UIView!
    
    @IBOutlet weak var avatar: UIImageView!
    
    @IBOutlet weak var username: UILabel!
    
    @IBOutlet weak var buttomMM: UIButton!
    
    @IBOutlet weak var InviteCode: UILabel!
    
    @IBOutlet weak var viewBottomHeader: UIView!
    override func awakeFromNib() {
        contentView.backgroundColor = UIColor(red:0.05, green:0.53, blue:0.86, alpha:1.0)
        avatar.layer.borderWidth = 3
        avatar.layer.borderColor = UIColor.whiteColor().CGColor
        avatar.clipsToBounds = true
        avatar.layer.cornerRadius = 10
        
        
        buttomMM.layer.cornerRadius = 9
        buttomMM.layer.borderWidth = 1
        buttomMM.layer.borderColor = UIColor(red:0.29, green:0.30, blue:0.36, alpha:1.0).CGColor
        buttomMM.backgroundColor = UIColor.whiteColor()
        let UserInfo:NSUserDefaults = NSUserDefaults.standardUserDefaults()        
        InviteCode.text = UserInfo.stringForKey("UserId")
        viewBottomHeader.backgroundColor = UIColor(red:0.29, green:0.30, blue:0.36, alpha:1.0)
        
        //viewBottomHeader.layer.borderWidth = 1
        //viewBottomHeader.layer.borderColor = UIColor(red:0.05, green:0.53, blue:0.86, alpha:1.0).CGColor
        
        
    }
    
    
    @IBAction func shareInviteCode(sender: UIButton) {
        
       
        
        
    }
    
    
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
