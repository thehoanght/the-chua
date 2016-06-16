//
//  LoginViewController.swift
//  Thẻ Chùa
//
//  Created by Hoang Dao on 4/3/16.
//  Copyright © 2016 Hoang Dao. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class LoginViewController: UIViewController,FBSDKLoginButtonDelegate {
    
    
    @IBOutlet weak var loadingActivity: UIActivityIndicatorView!
    
    @IBOutlet weak var lbLoading: UILabel!
    
    @IBOutlet weak var loginButton: UIButton!
    let UserInfo:NSUserDefaults = NSUserDefaults.standardUserDefaults()
    
    let facebookReadPermissios = ["public_profile","email","user_friends"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadingActivity.startAnimating()
        lbLoading.hidden = false
        loadingActivity.hidden = false
        
        
    }
    @IBAction func loginButtonTapped(sender: AnyObject) {
        
        let objFBSDKLoginManage: FBSDKLoginManager = FBSDKLoginManager()
        objFBSDKLoginManage.logInWithReadPermissions(self.facebookReadPermissios, fromViewController: self, handler: { (result,error) -> Void in
            
            if (error != nil) {
                
                print(error.localizedDescription)
                return
            } else{
                
                if (result.token != nil){
                    
                    self.loginButton.hidden = true
                    self.loadingActivity.startAnimating()
                    self.lbLoading.hidden = false
                    self.loadingActivity.hidden = false
                    self.requestUserInfo()
                
                }
            }
        })
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("Check connection")
        if (CheckConnection.isConnectedToNetwork() == true) {
            print("Started check login")
            
                if ( self.UserInfo.stringForKey("Token") != nil ) {
                    self.loginButton.hidden = true
                    self.loadingActivity.startAnimating()
                    self.lbLoading.hidden = false
                    self.loadingActivity.hidden = false
                    self.performSegueWithIdentifier("login", sender: nil)
                }
                else{
                    
                    self.loginButton.hidden = false
                    self.loadingActivity.startAnimating()
                    self.lbLoading.hidden = true
                    self.loadingActivity.hidden = true
                    
                }
                print("Finished check login")
            
        }else{
            let alert:UIAlertController = UIAlertController(title: "Lỗi kết nối", message: "Vui lòng kiểm tra kết nối của bạn và thử lại!", preferredStyle: .Alert)
            let alertAction = UIAlertAction(title: "Thử lại", style: .Default, handler: {(action) in
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let contentVC = storyboard.instantiateViewControllerWithIdentifier("LoginNavigationController") as! UINavigationController
                self.presentViewController(contentVC, animated: false, completion: nil)
            
            })
            alert.addAction(alertAction)
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!)
    {
        if (error != nil) {
            print(error.localizedDescription)
            return
        }
        
        if (result.token != nil) {
            loginButton.hidden = true
            loadingActivity.startAnimating()
            lbLoading.hidden = false
            loadingActivity.hidden = false
            self.requestUserInfo()
        }

    
    }
    
    func requestUserInfo() {
        FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, email"]).startWithCompletionHandler({ (connection, result, error) -> Void in
            if error == nil{
                
                let headers = ["cookie": "foo=bar; bar=baz"]
                
                let email = result!.valueForKey("email") as! String
                let id = result!.valueForKey("id") as! String
                let name = result!.valueForKey("name") as! String
                let url = LinkServe().UrlCheckUser
                let uuid:String = UIDevice.currentDevice().identifierForVendor!.UUIDString
                let postString = "email=\(email)&facebookId=\(id)&fullname=\(name)&uuid=\(uuid)"
                let request = NSMutableURLRequest(URL: NSURL(string: url)!, cachePolicy: .ReturnCacheDataElseLoad, timeoutInterval: 10.0)
                request.allHTTPHeaderFields = headers
                let session = NSURLSession.sharedSession()
                request.HTTPMethod = "POST"
                request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
                let task = session.dataTaskWithRequest(request) {
                    data, response, error in
                    if error != nil {
                        print("error=\(error)")
                        return
                    }
                    print("data login: \(data)")
                    print("response login  \(response)")
                    let resultString = NSString(data: data!, encoding: NSUTF8StringEncoding) as! String
                    print(resultString)
                    switch resultString {
                    case "ban":
                        let alert:UIAlertController = UIAlertController(title: "Error", message: "Bạn bị cấm tham gia cộng đồng Thẻ Chùa vì đã vi phạm điều khoản của chúng tôi. Cảm ơn!", preferredStyle: .Alert)
                        let alertAction:UIAlertAction = UIAlertAction(title: "OK", style: .Default, handler: { (action) in
                            exit(0)
                        })
                        alert.addAction(alertAction)
                        self.presentViewController(alert, animated: true, completion: nil)
                        
                    default :
                        self.UserInfo.setObject(email, forKey: "Email")
                        let token = resultString
                        self.UserInfo.setObject(token, forKey: "Token")
                        self.UserInfo.synchronize()
                        self.UserInfo.setObject(id, forKey: "FacebookId")
                        self.UserInfo.setObject(name, forKey: "Name")
                        self.UserInfo.setObject(1, forKey: "ISLOGGED")
                        self.UserInfo.synchronize()
                        if let data:NSArray = GetDataModel(Url: LinkServe().UrlgetUserId + token).ValuesData {
                            if  data.count > 0{
                                let dataUser = data[0]
                                let userId = dataUser["uid"]
                                let invitedBy = dataUser["invitedBy"]
                                self.UserInfo.setObject(invitedBy, forKey: "InvitedBy")
                                self.UserInfo.setObject(userId, forKey: "UserId")
                                self.UserInfo.synchronize()
                                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
                                    dispatch_async(dispatch_get_main_queue(), {
                                        self.gotoTabBar()
                                    })
                                })
                            }
                        }
                        
                    }
                }
                task.resume()
                
            }
        })

    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!)
    {
    }
    
    func gotoTabBar(){
//        
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let contentVC = storyboard.instantiateViewControllerWithIdentifier("TabBarViewController") as! UITabBarController
//        self.presentViewController(contentVC, animated: true, completion: nil)

        let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let LoginVC = storyboard.instantiateViewControllerWithIdentifier("LoginNavigationController") as! UINavigationController
        self.presentViewController(LoginVC, animated: false, completion: nil)
     }
    
    
        
    
    
    
}
