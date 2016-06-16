//
//  PostMethod.swift
//  Thẻ Chùa
//
//  Created by Hoang Dao on 4/8/16.
//  Copyright © 2016 Hoang Dao. All rights reserved.
//

import Foundation
import UIKit

class PostMethod {
    
    func pushString(url:String,postString:String){
        let request = NSMutableURLRequest(URL: NSURL(string: url)!)
        let session = NSURLSession.sharedSession()
        request.HTTPMethod = "POST"
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
        let task = session.dataTaskWithRequest(request) {
            data, response, error in
            if error != nil {
                print("error=\(error)")
                return
            }
        }
        task.resume()
    }
    
}
