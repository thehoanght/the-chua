//
//  LichsunhanxuModel.swift
//  Thẻ Chùa
//
//  Created by Hoang Dao on 5/6/16.
//  Copyright © 2016 Hoang Dao. All rights reserved.
//

import Foundation
import UIKit

class LichsudoiquaModel {
    var serial:String
    var imei:String
    var menhgia:String
    var method:String
    var created_at:String
    
    init(serial:String,imei:String,menhgia:String,method:String,created_at:String){
    
        self.serial = serial
        self.imei = imei
        self.menhgia = menhgia
        self.method = method
        self.created_at = created_at
        
    
    }
    
}