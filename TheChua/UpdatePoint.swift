//
//  UpdatePoint.swift
//  Thẻ Chùa
//
//  Created by Hoang Dao on 4/26/16.
//  Copyright © 2016 Hoang Dao. All rights reserved.
//

import Foundation
import UIKit

class UpdatePoint {
    
    func request() {
        
        let UserInfo:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        let token = UserInfo.stringForKey("Token")
        let url = NSURL(string: LinkServe().UrlGetPoint + token!)
        let data = NSData(contentsOfURL: url!)
        do{
            if let values:NSArray = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as? NSArray {
                print("Hien co \((values[0]["point"] as? NSString)!.integerValue) diem")
                UserInfo.setObject(values[0]["point"], forKey: "Point")
                UserInfo.synchronize()
            }
        }
        catch {
            print("error: \(error)")
            UserInfo.setObject(0, forKey: "Point")
            UserInfo.synchronize()
        }
        
        
    }
    

}