//
//  LichsunhanxuModel.swift
//  Thẻ Chùa
//
//  Created by Hoang Dao on 5/8/16.
//  Copyright © 2016 Hoang Dao. All rights reserved.
//

import Foundation
import UIKit

class LichsunhanxuModel {
    
    var noidung:String
    var point:Int
    var method:String
    var created_at:String
    
    init(noidung:String,point:Int,method:String,created_at:String){
        self.noidung = noidung
        self.point = point
        self.method = method
        self.created_at = created_at
    
    }
    
    
}