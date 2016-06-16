//
//  UIImageViews.swift
//  Thẻ Chùa
//
//  Created by Hoang Dao on 4/28/16.
//  Copyright © 2016 Hoang Dao. All rights reserved.
//

import Foundation
import UIKit

class UIImageViewAsync :UIImageView
{
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    func getDataFromUrl(url:String, completion: ((data: NSData?) -> Void)) {
        NSURLSession.sharedSession().dataTaskWithURL(NSURL(string: url)!) { (data, response, error) in
            completion(data: NSData(data: data!))
            }.resume()
    }
    
    func downloadImage(url:String){
        getDataFromUrl(url) { data in
            dispatch_async(dispatch_get_main_queue()) {
                
                self.contentMode = UIViewContentMode.ScaleAspectFill
                self.image = UIImage(data: data!)
            }
        }
    }
}