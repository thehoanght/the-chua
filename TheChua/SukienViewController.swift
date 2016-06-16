//
//  SukienViewController.swift
//  TheChua
//
//  Created by Hoang Dao on 3/21/16.
//  Copyright © 2016 Hoang Dao. All rights reserved.
//

import UIKit
import SafariServices

class SukienViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var contentViewBarItem: UIView!
    
    @IBOutlet weak var barItemRightButton: UIButton!
    
    
    var DataTableCell = Array<EventsModel>()
    
    var SukienData = EventsModel?()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentViewBarItem.layer.borderWidth = 1
        contentViewBarItem.layer.borderColor = UIColor.whiteColor().CGColor
        
        tableView.dataSource = self
        tableView.delegate = self
        
        let nib = UINib(nibName: "SukienTableViewCell", bundle: nil)
        tableView.registerNib(nib , forCellReuseIdentifier: "cell")
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
            self.getDataTableView()
            dispatch_async(dispatch_get_main_queue(), {
                Loading().showLoading()})
            dispatch_async(dispatch_get_main_queue(), {
                self.tableView.reloadData()
                let _ = Timeout(1){ self.tableView.reloadData()
                Loading().hideLoading()
                }
            })
        })
    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        //cap nhat diem
        let UserInfo:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        let point:String = UserInfo.stringForKey("Point")!
        
        barItemRightButton.setTitle(point, forState: .Normal)
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
        
        self.tableView.reloadData()
    }
    func getDataTableView(){
        if let Events:NSArray = GetDataModel.init(Url: LinkServe().UrlGetEvents + UserModel().Token()).ValuesData{
            //khai bao du lieu
            if (Events != NSArray()) {
                for i in 0...Events.count-1 {
                    let maindata = Events[i]
                    DataTableCell.append(EventsModel(tensukien: maindata["tensukien"] as! String, noidung: maindata["noidung"] as! String, point: maindata["point"] as! Int, image_url: maindata["image_url"] as! String))
                }
            }else{
                DataTableCell.removeAll()
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataTableCell.count + 2
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:SukienTableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! SukienTableViewCell
        switch indexPath.row {
        case 0:
            cell.hinhanh.image = UIImage(named: "ShareFacebook")
            cell.noidung.text = "Chia sẻ Thẻ Chùa tới bạn bè bạn sẽ nhận được 5000 xu"
            cell.tensukien.text = "Chia sẻ Thẻ Chùa"
        case 1:
            cell.hinhanh.image = UIImage(named: "invite-friends-icon")
            cell.noidung.text = "Nhập mã giới thiệu để nhận thưởng"
            cell.tensukien.text = "Nhập mã giới thiệu"
        default:
            let dataCell = DataTableCell[indexPath.row - 2]
            cell.hinhanh.image = dataCell.image
            cell.tensukien.text = dataCell.tenEvents
            cell.noidung.text = dataCell.noidung
        }
        
        cell.selectionStyle = UITableViewCellSelectionStyle.Gray
        cell.layoutMargins = UIEdgeInsetsZero
        cell.separatorInset = UIEdgeInsetsZero
        
        return cell
        
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        switch indexPath.row {
        case 0:
            self.performSegueWithIdentifier("sukienActionIdentifier", sender: nil)
        case 1:
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
            self.nhapmaGioithieu()
            })
        default:
            if DataTableCell.count > 0{
                SukienData = DataTableCell[indexPath.row-2]
                self.performSegueWithIdentifier("sukienFromServerIdentifier", sender: nil)
            }
        }
    }
    
    func nhapmaGioithieu() {
        var tField: UITextField!
        func configurationTextField(textField: UITextField!)
        {
            print("generating the TextField")
            textField.placeholder = "Nhập vào mã giới thiệu"
            tField = textField
        }
        func handleCancel(alertView: UIAlertAction!)
        {
            print("Cancelled !!")
        }
        
        
        let UserInfo:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        //TODO:: GET INVITEDBY
        dispatch_async(dispatch_get_main_queue(), {
            Loading().showLoading()
        })
        let data:NSArray = GetDataModel(Url: LinkServe().UrlgetUserId + UserModel().Token()).ValuesData
        if data != NSArray(){
            let dataUser = data[0]
            let inviteCode = dataUser["invitedBy"] as! String
            if  inviteCode != ""{
                UserInfo.setObject(inviteCode, forKey: "InvitedBy")
                UserInfo.synchronize()
            }
        }
        Loading().hideLoading()
        let invitedBy:String = (UserInfo.stringForKey("InvitedBy"))!
        if invitedBy != "" {
            print("InviteCode: \(invitedBy)")
            let alert = UIAlertController(title: "", message: "Bạn đã nhập mã giới thiệu rồi. Cảm ơn!", preferredStyle: .Alert)
            let okAlertAction = UIAlertAction(title: "OK", style: .Cancel, handler: nil)
            alert.addAction(okAlertAction)
            dispatch_async(dispatch_get_main_queue(), {
                self.presentViewController(alert, animated: true, completion: nil)
            })
            
        } else {
            //TODO:: Alert open page invite
            let nhapcodeAlert:UIAlertController = UIAlertController(title: "", message: "Xác nhận mã giới thiệu qua.", preferredStyle: .Alert)
            let webAlertAction:UIAlertAction = UIAlertAction(title: "Web", style: .Default, handler: { (action) in
                print("direct to web")
                let UserInfo:NSUserDefaults = NSUserDefaults.standardUserDefaults()
                if let uid:String = UserInfo.stringForKey("UserId"){
                    let safariVC = SFSafariViewController(URL: NSURL(string: LinkServe().InviteWeb+uid)!)
                    self.presentViewController(safariVC, animated: true, completion: nil)
                }
            })
            let nhapcodeAlertAction:UIAlertAction = UIAlertAction(title: "Nhập CODE", style: .Default, handler: { (action) in
                let alert = UIAlertController(title: "Nhập mã giới thiệu", message: "Nhập mã giới thiệu để nhận xu", preferredStyle: .Alert)
                alert.addTextFieldWithConfigurationHandler(configurationTextField)
                let confimAlertAction = UIAlertAction(title: "Xác nhận", style: .Default, handler: { (action) in
                    let invitedCode:String = tField.text!
                    print(invitedCode)
                    let postString = "&token=\(UserModel().Token())&inviteCode=\(invitedCode)"
                    PostMethod().pushString(LinkServe().UrlInvite + UserModel().Token(), postString: postString)
                    let data:NSArray = GetDataModel(Url: LinkServe().UrlgetUserId + UserModel().Token()).ValuesData
                    if data != NSArray(){
                        let dataUser = data[0]
                        let inviteCode = dataUser["invitedBy"] as! String
                        print("invite get from url:\(inviteCode)")
                        if (inviteCode != "") {
                            UserInfo.setObject(inviteCode, forKey: "InvitedBy")
                            UserInfo.synchronize()
                            UpdatePoint().request()
                            let alertDone = UIAlertController(title: "Chúc mừng", message: "Bạn đã nhập mã giới thiệu thành công!", preferredStyle: .Alert)
                            let alertDoneAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
                            alertDone.addAction(alertDoneAction)
                            dispatch_async(dispatch_get_main_queue(), {
                                self.presentViewController(alertDone, animated: true, completion: nil)
                            })
                        } else{
                            let alertDone = UIAlertController(title: "Lỗi", message: "Có lỗi khi nhập mã, vui lòng kiểm tra lại.", preferredStyle: .Alert)
                            let alertDoneAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
                            alertDone.addAction(alertDoneAction)
                            dispatch_async(dispatch_get_main_queue(), {
                                self.presentViewController(alertDone, animated: true, completion: nil)
                            })
                        }
                    }
                })
                let cancelAlertAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
                alert.addAction(confimAlertAction)
                alert.addAction(cancelAlertAction)
                dispatch_async(dispatch_get_main_queue(), {
                    self.presentViewController(alert, animated: true, completion: nil)
                })
            })
            let cancelAlertAction:UIAlertAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
            nhapcodeAlert.addAction(cancelAlertAction)
            nhapcodeAlert.addAction(webAlertAction)
            nhapcodeAlert.addAction(nhapcodeAlertAction)
            dispatch_async(dispatch_get_main_queue(), {
                self.presentViewController(nhapcodeAlert, animated: true, completion: nil)
            })
            
        }

    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 93
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "sukienFromServerIdentifier"{
            let sukienData = segue.destinationViewController as! ShowSuKienFromServerViewController
            sukienData.SukienData = SukienData
        }
    }
    

}
