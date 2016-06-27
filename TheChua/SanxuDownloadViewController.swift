//
//  SanxuDownloadViewController.swift
//  Thẻ Chùa
//
//  Created by Hoang Dao on 4/3/16.
//  Copyright © 2016 Hoang Dao. All rights reserved.
//

import UIKit
import SafariServices
class SanxuDownloadViewController: UIViewController {

    
    @IBOutlet weak var IconOffer: UIImageView!
    
    @IBOutlet weak var OfferName: UILabel!
    
    @IBOutlet weak var Point: UILabel!
    
    @IBOutlet weak var Des: UITextView!
    
    @IBOutlet weak var DownloadButton: UIButton!
    
    
    @IBOutlet var contentView: UIView!
    
    var SanxuDownloadData:OffersInfo?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
            }
    override func viewDidAppear(animated: Bool) {
        
        let OfferId:String! = SanxuDownloadData?.OfferId
        let OffersDownloadInfo:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        let dem = OffersDownloadInfo.integerForKey(OfferId)
        let checkLani = OffersDownloadInfo.integerForKey("checkLan\(OfferId)")
        
        
        print(dem," ",checkLani)
        if dem >= 3 {
            DownloadButton.setTitle("Nhận xu", forState: UIControlState.Normal)
        } else{
            DownloadButton.setTitle("Tải về", forState: UIControlState.Normal)
        }
        
    }
    override func viewWillAppear(animated: Bool) {
        
        IconOffer.layer.cornerRadius = 15
        IconOffer.clipsToBounds = true
        IconOffer.image = SanxuDownloadData?.image
        OfferName.text = SanxuDownloadData?.Name
        Point.text = String(SanxuDownloadData!.Point) + " xu"
        Des.text = SanxuDownloadData?.Des
//        
//        let OffersDownloadInfo:NSUserDefaults = NSUserDefaults.standardUserDefaults()
//        let Offer:String = (SanxuDownloadData?.OfferId)!
//        print(OffersDownloadInfo.stringForKey("StatusDownload\(Offer)"))
//        if(OffersDownloadInfo.stringForKey("StatusDownload\(Offer)") == "Installed"){
//            self.DownloadButton.enabled = false
//        }

    }
    
    @IBAction func DownloadButton(sender: UIButton) {
        let OfferId:String! = SanxuDownloadData?.OfferId
        let UserInfo:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        let UserId:String = UserInfo.stringForKey("UserId")!
        let OffersDownloadInfo:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        let dem = OffersDownloadInfo.integerForKey(OfferId)
        let checkLan = OffersDownloadInfo.integerForKey("checkLan\(OfferId)")
        print(checkLan)
        OffersDownloadInfo.setInteger(dem+1, forKey: OfferId)
        OffersDownloadInfo.setInteger(checkLan+1, forKey: "checkLan\(OfferId)")
        OffersDownloadInfo.synchronize()
        if checkLan == 0 {
            if checkInstalled() == true {
                OffersDownloadInfo.setObject("Installed", forKey: "StatusDownload\(OfferId)")
                OffersDownloadInfo.synchronize()
                //Report len serve da cai => ko cong diem va thong bao da cai truoc do
                let alert = UIAlertController(title: "", message: "Bạn đã cài ứng dụng trước đó", preferredStyle: .Alert)
                let alertAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
                alert.addAction(alertAction)
                self.presentViewController(alert, animated: true, completion: nil)
                return
            } else {
                OffersDownloadInfo.setObject("Dowloading", forKey: "StatusDownload\(OfferId)")
                OffersDownloadInfo.synchronize()
                let url = NSURL(string: LinkServe().UrlTracking+"?uid=\(UserId)&OfferId=\(OfferId)")
                showSafariBrowser(url!)
                return
            }
        }
        else {
            if checkInstalled() == true {
                if SanxuDownloadData?.Typepromote == "instant" {
                    //Report len serve da cai => cong diem va thong bao cong diem
                    OffersDownloadInfo.setObject("Installed", forKey: "StatusDownload\(OfferId)")
                    OffersDownloadInfo.synchronize()
                    let url = NSURL(string: LinkServe().InstantLead)
                    let request = NSMutableURLRequest(URL: url!)
                    let session = NSURLSession.sharedSession()
                    request.HTTPMethod = "POST"
                    let postString = "userid=\(UserId)&offerid=\(OfferId)"
                    request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
                    let task = session.dataTaskWithRequest(request, completionHandler: { (data, response, error) in
                        let resultString = NSString(data: data!, encoding: NSUTF8StringEncoding) as! String
                        switch resultString{
                        case "success":
                            let point:String = "\(self.SanxuDownloadData!.Point)"
                            let name:String = (self.SanxuDownloadData?.Name)!
                            let alert = UIAlertController(title: "", message: "Bạn nhận được \(point)  từ ứng dụng \(name). Xin cảm ơn!", preferredStyle: .Alert)
                            let alertAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
                            alert.addAction(alertAction)
                            dispatch_async(dispatch_get_main_queue(), {
                                self.presentViewController(alert, animated: true, completion: {
                                    let _ = self.checkInstalled()
                                })
                            })
                        case "installed":
                            OffersDownloadInfo.setObject("Installed", forKey: "StatusDownload\(OfferId)")
                            OffersDownloadInfo.synchronize()
                            //Report len serve da cai => ko cong diem va thong bao da cai truoc do
                            let alert = UIAlertController(title: "", message: "Bạn đã cài ứng dụng trước đó.", preferredStyle: .Alert)
                            let alertAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
                            alert.addAction(alertAction)
                            dispatch_async(dispatch_get_main_queue(), {
                                self.presentViewController(alert, animated: true, completion: nil)
                            })
                        default:
                            break
                        }
                    })
                    task.resume()
                } else {
                    let name:String = (self.SanxuDownloadData?.Name)!
                    let alert = UIAlertController(title: "", message: "Bạn đã cài đặt ứng dụng \(name). Hãy trải nghiệm \(name), chúng tôi sẽ cộng xu cho bạn nếu cài đặt hợp lệ.", preferredStyle: .Alert)
                    let alertAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
                    alert.addAction(alertAction)
                    dispatch_async(dispatch_get_main_queue(), {
                        self.presentViewController(alert, animated: true, completion: nil)
                    })
                }
            } else {
                OffersDownloadInfo.setObject("Downloading", forKey: "StatusDownload\(OfferId)")
                OffersDownloadInfo.synchronize()
                let url = NSURL(string: LinkServe().UrlTracking+"?uid=\(UserId)&OfferId=\(OfferId)")
                showSafariBrowser(url!)
                return
            }
        }
    }
    func showSafariBrowser(url:NSURL) {
        print(url)
        let safariVC = SFSafariViewController(URL: url)
        presentViewController(safariVC, animated: true, completion: nil)
    }
    
    func checkInstalled() -> Bool {
        let deeplinking = SanxuDownloadData?.Deeplinking
        if (UIApplication.sharedApplication().openURL(NSURL(string: deeplinking!)!)) {
            return true
        }
        else {
            return false
        }
    }
    
    
}
