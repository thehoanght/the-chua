//
//  ThemViewController.swift
//  TheChua
//
//  Created by Hoang Dao on 3/21/16.
//  Copyright © 2016 Hoang Dao. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class ThemViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {


    @IBOutlet weak var contentViewBarItem: UIView!
    
    
    @IBOutlet weak var barItemRightButton: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    
    var UserInfo = UserInfoModel.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentViewBarItem.layer.borderWidth = 1
        contentViewBarItem.layer.borderColor = UIColor.whiteColor().CGColor
        
        tableView.delegate = self
        tableView.dataSource = self
        let nib:UINib = UINib(nibName: "ProfileTableViewHeaderView", bundle: nil)
        tableView.registerNib(nib, forHeaderFooterViewReuseIdentifier: "ProfileTableViewHeaderView")
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(animated: Bool) {
        //cap nhat diem
        let UserInfo:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        let point:String = UserInfo.stringForKey("Point")!
        
        barItemRightButton.setTitle(point, forState: .Normal)
        
        //barItemRightButton.setTitle("123123", forState: UIControlState.Disabled)
        print("check connection")
        if (CheckConnection.isConnectedToNetwork() == false) {
            
            let alert:UIAlertController = UIAlertController(title: "Lỗi kết nối", message: "Vui lòng kiểm tra kết nối của bạn và thử lại!", preferredStyle: .Alert)
            let alertAction = UIAlertAction(title: "Thử lại", style: .Default, handler: {(action) in
                self.dismissViewControllerAnimated(false, completion: nil)
                
            })
            alert.addAction(alertAction)
            self.presentViewController(alert, animated: true, completion: nil)
        }else{
            print("connected")
            
        }
        

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        cell.textLabel?.textColor = UIColor(red:0.36, green:0.36, blue:0.36, alpha:1.0)
        cell.textLabel?.font = UIFont(name: "Helvetica Neue", size: 14)
        switch indexPath.row {
        case 0 : cell.textLabel?.text = "Lịch sử đổi quà"
                 cell.imageView?.image = UIImage(named: "lichsunhanquaIcon")
        case 1 : cell.textLabel?.text = "Lịch sử nhận xu"
                 cell.imageView?.image = UIImage(named: "lichsunhanxuIcon")
        case 2 : cell.textLabel?.text = "Đánh giá Thẻ Chùa"
                 cell.imageView?.image = UIImage(named: "danhgiaIcon")
        case 3 : cell.textLabel?.text = "Điều khoản"
                 cell.imageView?.image = UIImage(named: "dieukhoanIcon")
        case 4 : cell.textLabel?.text = "Thông tin"
                 cell.imageView?.image = UIImage(named: "thongtinIcon")
        case 5 : cell.textLabel?.text = "Đăng xuất"
                 cell.imageView?.image = UIImage(named: "dangxuatIcon")
                 cell.textLabel?.textColor = UIColor.redColor()
        default: print("chac khong co cai nay")
        
        }
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        return cell
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 150
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header:ProfileTableViewHeaderFooterView = self.tableView.dequeueReusableHeaderFooterViewWithIdentifier("ProfileTableViewHeaderView") as! ProfileTableViewHeaderFooterView
        
        header.avatar.image = UserInfo.avatar
        header.username.text = UserInfo.Name
        header.frame = CGRectMake(0, 0, self.tableView.frame.size.width, 190)
        header.buttomMM.addTarget(self, action: #selector(ThemViewController.showAlertHeader), forControlEvents: .TouchUpInside)
        return header
    }
    //TODO:: HEADER BUTTON SHARE
    
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
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        switch indexPath.row {
        case 0:
            identifierThem("lichsudoiquaIdentifier")
        case 1:
            identifierThem("lichsunhanxuIdentifier")
        case 2:
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
                if let dataGet:NSArray = GetDataModel(Url: LinkServe().GetEventShare).ValuesData {
                    if dataGet.count > 0{
                        let data1 = dataGet[0];
                        if let urlStore:String = data1["url_app_store"] as? String{
                            UIApplication.sharedApplication().openURL(NSURL(string: urlStore)!)
                        }
                    }
                }
            })
        case 3:
            identifierThem("dieukhoanIdentifier")
        case 4:
            identifierThem("thongtinIdentifier")
        case 5:
            //dang xuat facebook
            logout()
        default:
            print("system building")
        }
        
        
        
    }
    
    func logout(){
        
        let logoutActionSheet = UIAlertController(title: nil, message: "Bạn có muốn đăng xuất khỏi ứng dụng?", preferredStyle: UIAlertControllerStyle.ActionSheet)
        let dangxuatAction = UIAlertAction(title: "Đăng xuất", style: .Destructive) { (action) in
            let loginManager = FBSDKLoginManager()
            loginManager.logOut()
            let appDomain = NSBundle.mainBundle().bundleIdentifier
            NSUserDefaults.standardUserDefaults().removePersistentDomainForName(appDomain!)
            self.gotoLoginVC()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        logoutActionSheet.addAction(dangxuatAction)
        logoutActionSheet.addAction(cancelAction)
        
        self.presentViewController(logoutActionSheet, animated: false, completion: nil)
        
        
    }
    
    
    func identifierThem(identifier: String) {
        self.performSegueWithIdentifier(identifier, sender: nil)
    }
    
    
    func gotoLoginVC(){
        
        let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let LoginVC = storyboard.instantiateViewControllerWithIdentifier("LoginNavigationController") as! UINavigationController
        
        //let LoginVCNav = UINavigationController(rootViewController: LoginVC)
        
        //let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        //appDelegate.window?.rootViewController = LoginVCNav
        
        self.presentViewController(LoginVC, animated: true, completion: nil)
        
        
    }

}
