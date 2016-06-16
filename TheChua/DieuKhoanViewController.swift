//
//  DieuKhoanViewController.swift
//  Thẻ Chùa
//
//  Created by Hoang Dao on 6/2/16.
//  Copyright © 2016 Hoang Dao. All rights reserved.
//

import UIKit

class DieuKhoanViewController: UIViewController {

    @IBOutlet weak var myWebView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myWebView.loadRequest(NSURLRequest(URL: NSURL(string: LinkServe().Privacy)!))
        
    
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
