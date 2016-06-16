//
//  DoiquaViewController.swift
//  Thẻ Chùa
//
//  Created by Hoang Dao on 3/23/16.
//  Copyright © 2016 Hoang Dao. All rights reserved.
//

import UIKit

class DoiquaViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
//    @IBOutlet weak var contentViewBarItem: UIView!
//    
//    @IBOutlet weak var barItemRightButton: UIButton!
//    
    @IBOutlet weak var contentViewBarItem: UIView!
    
    @IBOutlet weak var barItemRightButton: UIButton!

    @IBOutlet weak var tableView: UITableView!
    
    var DataTableCell = Array<CardsMode>()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentViewBarItem.layer.borderWidth = 1
        contentViewBarItem.layer.borderColor = UIColor.whiteColor().CGColor
        tableView.delegate = self
        tableView.dataSource = self
        let nib:UINib = UINib(nibName: "DoiquaTableViewCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "DoiquaTableViewCell")
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
                dispatch_async(dispatch_get_main_queue(), {
                    Loading().showLoading()
                })
                self.getDataTableView()
                dispatch_async(dispatch_get_main_queue(), {
                    Loading().hideLoading()
                    self.tableView.reloadData()
                })
            })
    }
    
    
    func getDataTableView(){
        if let Cards:NSArray = GetDataModel.init(Url: LinkServe().UrlGetCards + UserModel().Token()).ValuesData{
            //khai bao du lieu
            if (Cards != NSArray()) {
                for i in 0...Cards.count-1 {
                    let maindata = Cards[i]
                    DataTableCell.append(CardsMode(method: maindata["method"] as! String, menhgia: (maindata["menhgia"] as! NSString).integerValue))
                }
            }else{
                DataTableCell.removeAll()
            }
        }
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
        } else{
            print("connected")
        
        }

        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
            dispatch_async(dispatch_get_main_queue(), {
                self.tableView.reloadData()
            })
        })
        
    }
    override func viewWillAppear(animated: Bool) {
        setTitlePoint()
    }
    func setTitlePoint() {
        let UserInfo:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        let point:String = UserInfo.stringForKey("Point")!
        self.barItemRightButton.setTitle(point, forState: .Normal)
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataTableCell.count
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
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:DoiquaTableViewCell = self.tableView.dequeueReusableCellWithIdentifier("DoiquaTableViewCell", forIndexPath: indexPath) as! DoiquaTableViewCell
        let dataCell = DataTableCell[indexPath.row]
        cell.textLabel?.font = UIFont(name: "Helvetica Neue", size: 12)
        //cell.selectionStyle = UITableViewCellSelectionStyle.None
        switch dataCell.method {
            case "Viettel":
                cell.imageThe.image = UIImage(named: "Viettel-Image")
            case "Mobifone":
                cell.imageThe.image = UIImage(named: "Mobile-Image")
            case "Vinaphone":
                cell.imageThe.image = UIImage(named: "Vina-Image")
        default:
            break
        }
        cell.menhgia.text = "\(dataCell.menhgia) VNĐ"
        cell.giaxu.text = "\(dataCell.menhgia) Xu"
        
        
        cell.layoutMargins = UIEdgeInsetsZero
        cell.separatorInset = UIEdgeInsetsZero
        
        return cell
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let dataCell = DataTableCell[indexPath.row]
        
        let alert = UIAlertController(title: "Thông Báo", message: "Bạn có muốn đổi \(dataCell.menhgia) xu lấy thẻ cào \(dataCell.method) \(dataCell.menhgia)đ.", preferredStyle: .Alert)
        let cancelActionAlert = UIAlertAction(title: "Không", style: .Destructive, handler: {(action) in
            
            
            
            })
        alert.addAction(cancelActionAlert)
        let okActionAlert = UIAlertAction(title: "Có", style: .Default, handler: {(action) in
            //Cap nhat diem
            UpdatePoint().request()
            let UserInfo:NSUserDefaults = NSUserDefaults.standardUserDefaults()
            let point:Int = UserInfo.integerForKey("Point")
            if(point>=dataCell.menhgia){
            
                let token:String = UserInfo.stringForKey("Token")!
                let postString = "menhgia=\(dataCell.menhgia)&token=\(token)&method=\(dataCell.method)"
                PostMethod().pushString(LinkServe().UrlRedeem, postString: postString)
                //Cap nhat lai point tren client
                let UserInfo:NSUserDefaults = NSUserDefaults.standardUserDefaults()
                let point:String = UserInfo.stringForKey("Point")!
                
                self.barItemRightButton.setTitle(point, forState: .Normal)
                let alertMs = UIAlertController(title: "Thông Báo", message: "Bạn đã gửi yêu cầu thành công. Chúng tôi sẽ gửi mã thẻ khi xử lý xong yêu cầu. Cảm ơn!", preferredStyle: .Alert)
                
                let okActionAlertMS = UIAlertAction(title: "OK", style: .Default, handler: { (action) in
                    UpdatePoint().request()
                    self.setTitlePoint()
                })
                alertMs.addAction(okActionAlertMS)
                dispatch_async(dispatch_get_main_queue(), {
                    self.presentViewController(alertMs, animated: true, completion: nil)
                })
                
            }
            
            else
            
            {
            
                let alertMs = UIAlertController(title: "Thông Báo", message: "Số xu của bạn không đủ để đổi thẻ này", preferredStyle: .Alert)
                let okActionAlertMS = UIAlertAction(title: "OK", style: .Default, handler: nil)
                alertMs.addAction(okActionAlertMS)
                dispatch_async(dispatch_get_main_queue(), {
                    self.presentViewController(alertMs, animated: true, completion: nil)
                })
                
            }
        
        
        
        })
        alert.addAction(okActionAlert)
        //Show alert
        self.presentViewController(alert, animated: true, completion: nil)
        
        
    }

}
