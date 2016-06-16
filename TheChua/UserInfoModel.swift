//
//  UserInfoModel.swift
//  Thẻ Chùa
//
//  Created by Hoang Dao on 4/11/16.
//  Copyright © 2016 Hoang Dao. All rights reserved.
//

import Foundation
import UIKit
class UserInfoModel {
    var Email:String = ""
    var FacebookId:String = ""
    var Name:String = ""
    var ISLOGGED:Int = 0
    private var _avatar = UIImage()
    var avatar:UIImage{get{
        
        return _avatar
        
        }}
    
    
    
    init(){
        
        let UserInfo:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        if (UserInfo.objectForKey("ISLOGGED") != nil ){
            self.Email = UserInfo.stringForKey("Email")!
            self.FacebookId = UserInfo.stringForKey("FacebookId")!
            self.Name = UserInfo.stringForKey("Name")!
            self.ISLOGGED = UserInfo.integerForKey("ISLOGGED")
            self._avatar = UIImage(data: NSData(contentsOfURL: NSURL(string: "https://graph.facebook.com/\(self.FacebookId)/picture?width=90&height=90")!)!)!
        }
        
        
        
    }
    

    
    
}