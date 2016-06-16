//
//  OffersInfo.swift
//  Thẻ Chùa
//
//  Created by Hoang Dao on 4/3/16.
//  Copyright © 2016 Hoang Dao. All rights reserved.
//

import Foundation
import UIKit

//Lay cac gia tri tren 1 phan tu mang offers get ve
class OffersInfo {
    var OfferId:String
    var Name:String
    var Point:Int
    var PointRRS:Int
    var Des:String
    var Deeplinking:String
    var Typepromote:String
    var OS:String
    var Url:NSURL
    //var image:UIImage
    
    private var _image = UIImage()
    var image: UIImage{
        get{
            return _image
        }
    }
    init(offerid:String,name:String,point:Int,point_rrs:Int,os:String,url:String,des:String,urlImage:String,deeplinking:String,typepromote:String){
        self.OfferId = offerid
        self.Name = name
        self.Point = point
        self.PointRRS = point_rrs
        self.OS = os
        self.Url = NSURL(string: url)!
        self.Des = des
        self.Deeplinking = deeplinking
        self.Typepromote = typepromote
        getDataFromUrl(urlImage) { data in
                let img = UIImage(data: data!)
                dispatch_async(dispatch_get_main_queue(),{
                    self._image = img!
                })
        }
    }
    private func getDataFromUrl(url:String, completion: ((data: NSData?) -> Void)) {
        NSURLSession.sharedSession().dataTaskWithURL(NSURL(string: url)!) { (data, response, error) in
            completion(data: NSData(data: data!))
            }.resume()
    }
}