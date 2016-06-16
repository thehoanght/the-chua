//
//  RRSViewController.swift
//  Thẻ Chùa
//
//  Created by Hoang Dao on 6/9/16.
//  Copyright © 2016 Hoang Dao. All rights reserved.
//

import UIKit
import SafariServices

class RRSViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var RRSListOffers = Array<OffersInfo>()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerNib(UINib(nibName: "RRSTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(animated: Bool) {
        self.tableView.reloadData()
        let _ = Timeout(1){
            self.tableView.reloadData()
        }
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let dataCell = RRSListOffers[indexPath.row]
        let cell:RRSTableViewCell = tableView.dequeueReusableCellWithIdentifier("cell") as! RRSTableViewCell
        cell.imageLogo.image = dataCell.image
        cell.nameOffer.text = dataCell.Name
        cell.pointRRS.text = "\(dataCell.PointRRS)"
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let dataCell = RRSListOffers[indexPath.row]
        let UserInfo:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        if UIApplication.sharedApplication().openURL(NSURL(string: dataCell.Deeplinking)!) {
            if  let token:String = UserInfo.stringForKey("Token"){
                PostMethod().pushString(LinkServe().RRS, postString: "token=\(token)&offerId=\(dataCell.OfferId)")
                
            }
            UpdatePoint().request()
        }else{
            if let uid:String = UserInfo.stringForKey("UserId"){
                let url = NSURL(string: LinkServe().UrlTracking+"?UserId=\(uid)&OfferId=\(dataCell.OfferId)")
                showSafariBrowser(url!)
            }
            
        }
    }
    
    func showSafariBrowser(url:NSURL) {
        let safariVC = SFSafariViewController(URL: url)
        presentViewController(safariVC, animated: true, completion: nil)
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 70
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
