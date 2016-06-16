//
//  UserModel.swift
//  Thẻ Chùa
//
//  Created by Hoang Dao on 5/8/16.
//  Copyright © 2016 Hoang Dao. All rights reserved.
//

import Foundation
import UIKit

class UserModel {
    
    func Token() -> String {
        let UserInfo:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        if let token:String = UserInfo.stringForKey("Token")!{
            if token != String() {
                return token
            }else{
                return String();
            }
        }
    }
    func UserId() -> String {
        let UserInfo:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        if let uid:String = UserInfo.stringForKey("UserId")!{
            if uid != String() {
                return uid
            }else{
                return String();
            }
        }
    }
    
    
}