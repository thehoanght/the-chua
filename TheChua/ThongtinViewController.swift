//
//  ThongtinViewController.swift
//  Thẻ Chùa
//
//  Created by Hoang Dao on 6/2/16.
//  Copyright © 2016 Hoang Dao. All rights reserved.
//

import UIKit

class ThongtinViewController: UIViewController {

    @IBOutlet weak var myWebView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let urlString = LinkServe().Contact
        let url = NSURL(string: urlString)
        let request = NSURLRequest(URL: url!)
        myWebView.loadRequest(request)
        myWebView.request
        // Do any additional setup after loading the view.
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
