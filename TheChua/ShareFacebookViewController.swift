//
//  ShareFacebookViewController.swift
//  Thẻ Chùa
//
//  Created by Hoang Dao on 5/15/16.
//  Copyright © 2016 Hoang Dao. All rights reserved.
//

import UIKit

class ShareFacebookViewController: UIViewController {

    @IBOutlet weak var chiase: UIButton!
    @IBOutlet weak var copyLink: UIButton!
    
    @IBOutlet var contentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chiase.layer.cornerRadius = 5
        copyLink.layer.cornerRadius = 5
        // Do any additional setup after loading the view.
    }

    @IBAction func shareFacebook(sender: AnyObject) {
        
        ShareFacebookModel().ShareFacebook()
        
    }
    
    @IBAction func copyLink(sender: AnyObject) {
        let pasteboard = UIPasteboard.generalPasteboard()
        pasteboard.string = ShareFacebookModel().shareLink
            let alert = UIAlertController(title: "", message: "Bạn đã copy link. Hãy chia sẻ link này đến bạn bè để nhận được nhiều xu hơn.", preferredStyle: .Alert)
            let alertAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alert.addAction(alertAction)
            self.presentViewController(alert, animated: true, completion: nil)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
