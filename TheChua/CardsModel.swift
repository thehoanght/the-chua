//
//  EventsModel.swift
//  Thẻ Chùa
//
//  Created by Hoang Dao on 5/23/16.
//  Copyright © 2016 Hoang Dao. All rights reserved.
//

import Foundation
import UIKit

class CardsMode {
    var method:String
    var menhgia:Int
//    private var _image:UIImage
//    var image:UIImage{
//        get{
//            return _image
//        }
//    }
    init(method:String,menhgia:Int){
        self.method = method
        self.menhgia = menhgia
        //self._image = DownloadImage(url: urlimage).image
        //self._image = UIImage(data: NSData(contentsOfURL: NSURL(string: urlimage)!)!)!
    }
}