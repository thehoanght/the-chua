//
//  GetDataModel.swift
//  Thẻ Chùa
//
//  Created by Hoang Dao on 4/1/16.
//  Copyright © 2016 Hoang Dao. All rights reserved.
//

import Foundation
import UIKit
//Lay gia tri tren 1URL tra ve
class GetDataModel {
    var ValuesData: NSArray = []
    init (Url:String){
        let url = NSURL(string:Url)
        if let data = NSData(contentsOfURL: url!){
            if data != NSData() {
                do{
                    if let valuesTemp:NSArray = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers) as? NSArray{
                        self.ValuesData = valuesTemp
                    }
                    
                } catch{
                    self.ValuesData = NSArray()
                }
            }
        }
    }
}
