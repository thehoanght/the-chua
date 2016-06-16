//
//  EventsModel.swift
//  Thẻ Chùa
//
//  Created by Hoang Dao on 5/24/16.
//  Copyright © 2016 Hoang Dao. All rights reserved.
//

import Foundation
import UIKit

class EventsModel{
    var tenEvents:String
    var noidung:String
    var point:Int
    private var _image = UIImage()
    var image:UIImage{get{
            return _image
        }}
    init(tensukien:String,noidung:String,point:Int,image_url:String){
        self.tenEvents = tensukien
        self.noidung = noidung
        self.point = point
        getDataFromUrl(image_url) { data in
            dispatch_async(dispatch_get_main_queue()) {
                let img = UIImage(data: data!)
                self._image = img!
            }
        }
    }
    private func getDataFromUrl(url:String, completion: ((data: NSData?) -> Void)) {
        NSURLSession.sharedSession().dataTaskWithURL(NSURL(string: url)!) { (data, response, error) in
            completion(data: NSData(data: data!))
            }.resume()
    }
    
}