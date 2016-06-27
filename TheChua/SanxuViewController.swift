//
//  ViewController.swift
//  TheChua
//
//  Created by Hoang Dao on 3/19/16.
//  Copyright © 2016 Hoang Dao. All rights reserved.
//

import UIKit
import CoreData
import Social
import FBSDKShareKit

class SanxuViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var contentViewBarItem: UIView!
    
    @IBOutlet weak var barItemRightButton: UIButton!
    
    
    var refreshController = UIRefreshControl()
    
    var UrlImageCell = [NSURL]()
    
    var DataTableCell = Array<OffersInfo>()
    
    var DataTableCellTemp = Array<OffersInfo>()
    
    var SanxuDownloadData:OffersInfo?
    
    var RRSListOffers = Array<OffersInfo>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let UserInfo:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        print(UserInfo.accessibilityElementCount())
        
        //CHECK Status
        print("Check status")
        self.checkStatus()
        print("Check status xong")
        
        refreshController.attributedTitle = NSAttributedString(string: "Đang cập nhật dữ liệu...")
        refreshController.tintColor = UIColor(red:0.36, green:0.36, blue:0.36, alpha:1.0)
        refreshController.addTarget(self, action: #selector(SanxuViewController.refresh), forControlEvents: UIControlEvents.ValueChanged)
        tableView.addSubview(refreshController)
        contentViewBarItem.layer.borderWidth = 1
        contentViewBarItem.layer.borderColor = UIColor.whiteColor().CGColor
        //Update Point
        
        tableView.delegate = self
        tableView.dataSource = self
        let nib:UINib = UINib(nibName: "SanxuCustomTableViewHeaderFooterView", bundle: nil)
        tableView.registerNib(nib, forHeaderFooterViewReuseIdentifier: "SanxuCustomTableViewHeaderFooterView")
        
        let nibFooter:UINib = UINib(nibName: "SanxuFooterTableViewHeaderFooterView", bundle: nil)
        tableView.registerNib(nibFooter, forHeaderFooterViewReuseIdentifier: "SanxuFooterTableViewHeaderFooterView")
        
        let nibOfferView:UINib = UINib(nibName: "OffersView", bundle: nil)
        tableView.registerNib(nibOfferView, forCellReuseIdentifier: "cell")
        
        let nibEmptyOfferView:UINib = UINib(nibName: "EmptyTableView", bundle: nil)
        tableView.registerNib(nibEmptyOfferView, forCellReuseIdentifier: "cellEmpty")
        
        tableView.tableFooterView = UIView(frame: CGRectZero)
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
                print("Load data")
                self.getDataTableView()
                print("Load data xong")
                dispatch_async(dispatch_get_main_queue(), {
                    let _ = Timeout(1){self.tableView.reloadData()}
                self.tableView.reloadData()
                })
            })
    }
    func checkStatus() {
        if let token:String = UserModel().Token() {
            print("Token = \(token)")
            if token != ""{
                let url = LinkServe().CheckStatus
                let postString:String = "token=\(token)"
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
                    let resultString = NSString(data: data!, encoding: NSUTF8StringEncoding) as! String
                    print(resultString)
                    switch resultString {
                        
                    case "0":
                        let alert:UIAlertController = UIAlertController(title: "", message: "Bạn bị cấm tham gia cộng đồng Thẻ Chùa vì đã vi phạm điều khoản của chúng tôi. Cảm ơn!", preferredStyle: .Alert)
                        let alertAction:UIAlertAction = UIAlertAction(title: "OK", style: .Default, handler: { (action) in
                            exit(0)
                        })
                        alert.addAction(alertAction)
                        dispatch_async(dispatch_get_main_queue(), {
                            self.presentViewController(alert, animated: true, completion: nil)})
                    default :
                        break
                    }
                }
                task.resume()
                
            }
        }
    }
    override func viewDidAppear(animated: Bool) {
        print("check connection")
        if (CheckConnection.isConnectedToNetwork() == false) {
            
            let alert:UIAlertController = UIAlertController(title: "Lỗi kết nối", message: "Vui lòng kiểm tra kết nối của bạn và thử lại!", preferredStyle: .Alert)
            let alertAction = UIAlertAction(title: "Thử lại", style: .Default, handler: {(action) in
                self.dismissViewControllerAnimated(true, completion: nil)
            
            })
            alert.addAction(alertAction)
            self.presentViewController(alert, animated: false, completion: nil)
        }else{
            print("connected")
            
        }
    }
    
    func refresh() {
            //self.DataTableCell.removeAll()
        dispatch_after(0, dispatch_get_main_queue(), {
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
                self.getDataTableView()
                dispatch_async(dispatch_get_main_queue(), {
                    let _ = Timeout(1){
                        self.tableView.reloadData()
                        self.refreshController.endRefreshing()
                    }
                    
                })
            })
        })
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
            UpdatePoint().request()
            //Thong ke Google Analytics
            self.ggAnalytics("SanxuViewController")
            
            dispatch_async(dispatch_get_main_queue(), {
                let UserInfo:NSUserDefaults = NSUserDefaults.standardUserDefaults()
                let point:String = UserInfo.stringForKey("Point")!
                self.barItemRightButton.setTitle(point, forState: .Normal)
            })
        })
    }
    
    func ggAnalytics(name:String){
    
        let tracker = GAI.sharedInstance().defaultTracker
        tracker.set(kGAIScreenName, value: name)
        let builder = GAIDictionaryBuilder.createScreenView()
        tracker.send(builder.build() as [NSObject : AnyObject])
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    //TODO:: GET DATA
    func getDataTableView(){
        //var Offers:NSArray = []
        let UserInfo = NSUserDefaults.standardUserDefaults()
        if let token:String = UserInfo.stringForKey("Token")! {
            if let Offers:NSArray = GetDataModel(Url: LinkServe().UrlGetOffers + "?token=\(token)").ValuesData {
                //khai bao du lieu
                if (Offers != NSArray()) {
                    DataTableCellTemp.removeAll()
                    UrlImageCell.removeAll()
                    for i in 0...Offers.count-1 {
                        let maindata = Offers[i]
                        let offerid = maindata["offerId"] as! String
                        let typepromote = maindata["typepromote"] as! String
                        let OS = maindata["OS"] as! String
                        let OffersDownloadInfo:NSUserDefaults = NSUserDefaults.standardUserDefaults()
                        let status = OffersDownloadInfo.stringForKey("StatusDownload\(offerid)")
                        print(status,"dieu kien: ",(status != "Installed" || typepromote != "instant") || OS == "Android" )
                        
                        if (status != "Installed" || typepromote != "instant") {
                            self.DataTableCellTemp.append(OffersInfo(offerid: maindata["offerId"] as! String, name: maindata["name"] as! String, point: ((maindata["point"] as? NSString)?.integerValue)!,point_rrs: ((maindata["point_rrs"] as? NSString)?.integerValue)!, os: maindata["OS"] as! String, url: maindata["url"] as! String, des: maindata["description"] as! String, urlImage: maindata["imageUrl"] as! String, deeplinking: maindata["deeplinking"] as! String, typepromote: maindata["typepromote"] as! String))
                            self.UrlImageCell.append(NSURL(string: (maindata["imageUrl"]) as! String)!)
                        }
                    }
                    DataTableCell.removeAll()
                    self.DataTableCell = self.DataTableCellTemp
                }else{
                    
                    DataTableCell.removeAll()
                }
            }
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if DataTableCell.count > 0 {
            let cell:OffersViewTableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! OffersViewTableViewCell
            cell.selectionStyle = UITableViewCellSelectionStyle.None
            cell.OfferName.font = UIFont(name: "Helvetica Neue", size: 14)
            //truyen du lieu va 1 bien data chua index
            let dataTable = DataTableCell[indexPath.row]
            if dataTable.Typepromote == "instant" {
                cell.ShareIcon.hidden = true
            }
            if dataTable.OS == "iOS" {
                cell.AndroidIcon.hidden = true
            }else{
                cell.AndroidIcon.hidden = false
            }
            cell.OfferName.text = dataTable.Name
            cell.PayoutOffer.text = String(dataTable.Point) + " xu"
            cell.loadingActivity.hidden = false
            cell.loadingActivity.startAnimating()
            cell.OfferImage.image = dataTable.image
            cell.loadingActivity.hidden = true
            cell.layoutMargins = UIEdgeInsetsZero
            cell.separatorInset = UIEdgeInsetsZero
            return cell
        } else {
            let cell:EmptyTableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cellEmpty", forIndexPath: indexPath) as! EmptyTableViewCell
            cell.selectionStyle = UITableViewCellSelectionStyle.None
            return cell
        }
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        if DataTableCell.count > 0 {
            return DataTableCell[indexPath.row].Typepromote == "instant" ? false:true
        } else {
            return false
        }
    }
    
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        if DataTableCell.count > 0 {
            let dataCell = DataTableCell[indexPath.row]
            if (dataCell.Typepromote != "instant") {
                let shareAction = UITableViewRowAction(style: UITableViewRowActionStyle.Normal, title: "Chia sẻ") { (rowAction, indexPath) in
                    let shareActionSheet = UIAlertController(title: "Chia sẻ ứng dụng", message: "Bạn sẽ nhận được \(dataCell.Point) xu khi chia sẻ ứng dụng \(dataCell.Name) đến bạn bè.", preferredStyle: .ActionSheet)
                    let facebookAction = UIAlertAction(title: "Facebook", style: .Default) { (action) in
                        
                        
                        let shareText = "Tải ngay \(dataCell.Name). (\(dataCell.OS))"
                        let content:FBSDKShareLinkContent = FBSDKShareLinkContent()
                        content.contentTitle = shareText
                        content.contentDescription = dataCell.Des
                        content.contentURL = NSURL(string: LinkServe().UrlTracking+"?uid=\(UserModel().UserId())&OfferId=\(dataCell.OfferId)")
                        let imageUrlOffer = self.UrlImageCell[indexPath.row]
                        content.imageURL = imageUrlOffer
                        
                        let dialog:FBSDKShareDialog = FBSDKShareDialog()
                        dialog.shareContent = content
                        
                        if !dialog.canShow(){
                            print("show dialog")
                            dialog.mode = FBSDKShareDialogMode.Browser
                        }
                        dialog.show()
                    }
                    
                    let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
                    
                    shareActionSheet.addAction(facebookAction)
                    shareActionSheet.addAction(cancelAction)
                    
                    self.presentViewController(shareActionSheet, animated: true, completion: nil)
                    
                }
                shareAction.backgroundColor = UIColor(red: 0.0, green: 122.0/255.0, blue: 1.0, alpha: 1.0)
                
                return [shareAction]
            } else {
                return nil
            }
        
        } else{
            return nil
        }
    }
    func alert(title:String, msg:String){
        
        let alertVC = UIAlertController(title: title, message: msg, preferredStyle: .Alert)
        let alertAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alertVC.addAction(alertAction)
        
        self.presentViewController(alertVC, animated: true, completion: nil)
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if DataTableCell.count > 0 {
            return DataTableCell.count
        }else{
            return 1
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
            return 70
        
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 217
    }
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header:SanxuCustomTableViewHeaderFooterView = self.tableView.dequeueReusableHeaderFooterViewWithIdentifier("SanxuCustomTableViewHeaderFooterView") as! SanxuCustomTableViewHeaderFooterView
        header.frame = CGRectMake(0, 0, self.tableView.frame.size.width, 217)
        header.ShareButton.addTarget(self, action: #selector(SanxuViewController.showAlertHeader), forControlEvents: .TouchUpInside)
        return header
    }
    
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let footer:SanxuFooterTableViewHeaderFooterView = self.tableView.dequeueReusableHeaderFooterViewWithIdentifier("SanxuFooterTableViewHeaderFooterView") as! SanxuFooterTableViewHeaderFooterView
        footer.frame = CGRectMake(0, 0, tableView.frame.size.width, 70)
        footer.footerButton.addTarget(self, action: #selector(SanxuViewController.footerButton), forControlEvents: .TouchUpInside)
        
        return footer
    }
    
    func footerButton() {
        //TODO:: Load data RRS
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
            let UserInfo:NSUserDefaults = NSUserDefaults.standardUserDefaults()
            self.RRSListOffers.removeAll()
            
            if let token:String = UserInfo.stringForKey("Token")!{
                if let Offers:NSArray = GetDataModel.init(Url: LinkServe().GetRRSOffers + token).ValuesData {
                    if Offers.count>0 {
                        for i in 0..<Offers.count {
                            let maindata = Offers[i]
                            if maindata["OS"] as! String == "iOS" {
                            self.RRSListOffers.append(OffersInfo(offerid: maindata["offerId"] as! String, name: maindata["name"] as! String, point: maindata["point"] as! Int,point_rrs: maindata["point_rrs"] as! Int, os: maindata["OS"] as! String, url: maindata["url"] as! String, des: maindata["description"] as! String, urlImage: maindata["imageUrl"] as! String, deeplinking: maindata["deeplinking"] as! String, typepromote: maindata["typepromote"] as! String))
                            }
                        }
                    }
                }
            }
            //TODO:: Send to RRS ViewController
            dispatch_async(dispatch_get_main_queue(), {
                if self.RRSListOffers.count>0{
                    self.performSegueWithIdentifier("rrsIdentifier", sender: nil)
                }
                else{
                    let alert:UIAlertController = UIAlertController(title: "", message: "Hôm nay không có ứng dụng để chạy lại.", preferredStyle: .Alert)
                    let alertAction:UIAlertAction = UIAlertAction(title: "OK", style: .Cancel, handler: nil)
                    alert.addAction(alertAction)
                    self.presentViewController(alert, animated: true, completion: nil)
                }
            })
        })
    }
    
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 70
    }
    //TODO:: HEADER BUTTON SHARE
    func showAlertHeader() {
        let UserInfo:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        let userid:String = UserInfo.stringForKey("UserId")!
        let alert = UIAlertController(title: "Chia sẻ Thẻ Chùa", message: "Mã giới thiệu của bạn là \(userid). Hãy chia sẻ Thẻ Chùa tới bạn bè của bạn để kiếm hàng triệu Xu từ chúng tôi.", preferredStyle: .ActionSheet)
        let alertShareFacebookAction = UIAlertAction(title: "Chia sẻ trên Facebook", style: .Default) { (action) in
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
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if DataTableCell.count > 0 {
            SanxuDownloadData = DataTableCell[indexPath.row]
            if SanxuDownloadData?.OS == "iOS"{
            let offerId:String = (SanxuDownloadData?.OfferId)!
            let key:String = "StatusDownload\(offerId)"
            let OffersDownloadInfo:NSUserDefaults = NSUserDefaults.standardUserDefaults()
            if let downloadStatus = OffersDownloadInfo.stringForKey(key){
                print(downloadStatus)
                if downloadStatus != "Installed" {
                    
                    self.performSegueWithIdentifier("showOfferIndentifier", sender: nil)
                    
                } else{
                    let alert = UIAlertController(title: "", message: "Bạn đã cài đặt ứng dụng \(DataTableCell[indexPath.row].Name). Hãy chia sẻ ứng dụng này đến bạn bè để có thể tiếp tục nhận xu từ chúng tôi.", preferredStyle: .Alert)
                    let alertAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
                    alert.addAction(alertAction)
                    self.presentViewController(alert, animated: true, completion: nil)
                }
            
            } else{
                    self.performSegueWithIdentifier("showOfferIndentifier", sender: nil)
            
            }
            } else{
            //Thong bao chia se qua Android
            let alert = UIAlertController(title: "", message: "Đây là ứng dụng cho máy Android, hãy chia sẻ ứng dụng này tới bạn bè dùng máy Android để có thể kiếm \(SanxuDownloadData!.Point) Xu.", preferredStyle: .Alert)
            let alertShareAction = UIAlertAction(title: "Chia sẻ", style: .Default, handler: { (action) in
                
                
                let shareText = "Tải ngay \(self.SanxuDownloadData!.Name). (\(self.SanxuDownloadData!.OS))"
                let content:FBSDKShareLinkContent = FBSDKShareLinkContent()
                content.contentTitle = shareText
                content.contentDescription = self.SanxuDownloadData?.Des
                content.contentURL = NSURL(string: LinkServe().UrlTracking+"?uid=\(UserModel().UserId())&OfferId=\(self.SanxuDownloadData!.OfferId)")
                let imageUrlOffer = self.UrlImageCell[indexPath.row]
                content.imageURL = imageUrlOffer                
                let dialog:FBSDKShareDialog = FBSDKShareDialog()
                dialog.shareContent = content
                
                if !dialog.canShow(){
                    print("show dialog")
                    dialog.mode = FBSDKShareDialogMode.Browser
                }
                dialog.show()
            })
                let alertCancelAction = UIAlertAction(title: "Cancel", style: .Default, handler: nil)
                alert.addAction(alertShareAction)
                alert.addAction(alertCancelAction)
                self.presentViewController(alert, animated: true, completion: nil)
            }
        }
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showOfferIndentifier"{
            let SanxuDownloadVC = segue.destinationViewController as! SanxuDownloadViewController
            SanxuDownloadVC.SanxuDownloadData = SanxuDownloadData
        }
        let identifierString:String = segue.identifier!
        switch  identifierString {
        case "showOfferIndentifier":
            let SanxuDownloadVC = segue.destinationViewController as! SanxuDownloadViewController
            SanxuDownloadVC.SanxuDownloadData = SanxuDownloadData
        case "rrsIdentifier":
            if RRSListOffers.count>0{
                let RRSVC = segue.destinationViewController as! RRSViewController
                RRSVC.RRSListOffers = RRSListOffers
            }
        default:
            break
        }
        
        
    }
    
    
   
}

