//
//  SukienActionViewController.swift
//  Thẻ Chùa
//
//  Created by Hoang Dao on 5/25/16.
//  Copyright © 2016 Hoang Dao. All rights reserved.
//

import UIKit

class SukienActionViewController: UIViewController {
    @IBOutlet weak var TenSuKien: UILabel!
    
    @IBOutlet weak var NoiDung: UITextView!
    
    @IBOutlet weak var HinhAnh: UIImageView!
    
    @IBOutlet weak var bottomLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        HinhAnh.layer.cornerRadius = 5
        HinhAnh.layer.borderWidth = 0
        HinhAnh.layer.borderColor = UIColor.whiteColor().CGColor
        HinhAnh.layer.masksToBounds = true
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
        
        self.loadData()
        
        })
        
    }
    func loadData() {
        if let getData:NSArray = GetDataModel(Url: LinkServe().GetEventShare).ValuesData{
            print(getData.count)
            if getData.count > 0 {
                let maindata = getData[0]
                let pointShare:Int = maindata["point"] as! Int
                let noidung:String = maindata["noidung"] as! String
                let title:String = maindata["title"] as! String
                TenSuKien.text = title
                NoiDung.text = noidung
                bottomLabel.text = "Bạn nhận được \(pointShare) Xu mời được 1 người mới"
                
            }
        }
    }
    func showAlertHeader() {
        let UserInfo:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        if let userid:String = UserInfo.stringForKey("UserId"){
            let alert = UIAlertController(title: "Chia sẻ Thẻ Chùa", message: "Mã giới thiệu của bạn là \(userid). Hãy chia sẻ Thẻ Chùa tới bạn bè của bạn để kiếm hàng triệu Xu từ chúng tôi.", preferredStyle: .ActionSheet)
            let alertShareFacebookAction = UIAlertAction(title: "Facebook", style: .Default) { (action) in
                ShareFacebookModel().ShareFacebook()
            }
            
            
            
            let alertCopyLinkAction = UIAlertAction(title: "Copy Link", style: .Default) { (action) in
                UIPasteboard.generalPasteboard().string = LinkServe().LinkShare + userid
            }
            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
            
            alert.addAction(alertShareFacebookAction)
            alert.addAction(alertCopyLinkAction)
            alert.addAction(cancelAction)
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func trove(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    
    @IBAction func actionButton(sender: AnyObject) {
        showAlertHeader()
    }

}
