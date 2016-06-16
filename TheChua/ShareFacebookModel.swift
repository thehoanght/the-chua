//
//  ShareFacebookModel.swift
//  Thẻ Chùa
//
//  Created by Hoang Dao on 5/15/16.
//  Copyright © 2016 Hoang Dao. All rights reserved.
//

import Foundation
import UIKit
import FBSDKShareKit
class ShareFacebookModel{
    func ShareFacebook() {
        if let dataShare:NSArray = GetDataModel(Url: LinkServe().GetEventShare).ValuesData{
            if dataShare.count>0 {
                let maindata = dataShare[0]
                let shareLink:String = maindata["url_app_store"] as! String
                let urlImage:String = maindata["url_image_app"] as! String
                let content = FBSDKShareLinkContent()
                content.contentDescription = maindata["content_share"] as! String
                content.contentTitle = maindata["content_title_share"] as! String
                content.contentURL = NSURL(string: shareLink)
                content.imageURL = NSURL(string: urlImage)
                let dialog = FBSDKShareDialog()
                dialog.shareContent = content
                if !dialog.canShow() {
                    dialog.mode = FBSDKShareDialogMode.FeedBrowser
                }
                dialog.show()
            }
        }
    }
    
}