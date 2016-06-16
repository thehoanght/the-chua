//
//  SanxuCustomTableViewHeaderFooterView.swift
//  TheChua
//
//  Created by Hoang Dao on 3/20/16.
//  Copyright © 2016 Hoang Dao. All rights reserved.
//

import UIKit


class SanxuCustomTableViewHeaderFooterView: UITableViewHeaderFooterView {
    
    @IBOutlet weak var ContentView: UIView!
    @IBOutlet weak var imageS: UIImageView!

    @IBOutlet weak var view2: UIView!
    
    @IBOutlet weak var PointBanner: UILabel!
    
    @IBOutlet weak var ShareButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.backgroundColor = UIColor.clearColor()
        
        view2.backgroundColor = UIColor.clearColor()
        
        imageS.layer.borderWidth = 2
        imageS.layer.borderColor = UIColor.whiteColor().CGColor
        imageS.layer.cornerRadius = imageS.frame.size.height/2
        imageS.layer.masksToBounds = true
        
        if let getData:NSArray = GetDataModel(Url: LinkServe().GetEventShare).ValuesData {
            if getData.count > 0 {
                let maindata = getData[0]
                let pointShare:Int = (maindata["point"] as! NSString).integerValue
                PointBanner.text = "\(pointShare) Xu/ 1 lượt cài đặt"
            }
        }
        print("load banner xong")
        
        
        
        
    }
    
}
