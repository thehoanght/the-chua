//
//  LichsunhanxuViewController.swift
//  Thẻ Chùa
//
//  Created by Hoang Dao on 5/5/16.
//  Copyright © 2016 Hoang Dao. All rights reserved.
//

import UIKit

class LichsunhanxuViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    
    var DataTableCell = Array<LichsunhanxuModel>()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: "LichsunhanxuCustomTableViewCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "cell")
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            dispatch_async(dispatch_get_main_queue(), {
                Loading().showLoading()
            })
        }
    }
    override func viewDidAppear(animated: Bool) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            
            self.getDataTable()
            dispatch_async(dispatch_get_main_queue(), {
            self.tableView.reloadData()
            Loading().hideLoading()
            })
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        var numOfSection: NSInteger = 0
        
        if DataTableCell.count > 0 {
            self.tableView.backgroundView = nil
            numOfSection = 1
            
        } else {
            let win:UIWindow = ((UIApplication.sharedApplication().delegate?.window)!)!
            let noData = UIImageView(frame: CGRect(x: win.frame.width/3, y: win.frame.height/3, width: win.frame.width/3, height: win.frame.width/3))
            noData.image = UIImage(named: "NoData")
            noData.layer.borderWidth = 2
            noData.layer.borderColor = UIColor(red:0.29, green:0.30, blue:0.36, alpha:1.0).CGColor
            noData.layer.masksToBounds  = true
            noData.layer.cornerRadius = noData.frame.width/2
            let viewNoData = UIView(frame: win.frame)
            viewNoData.addSubview(noData)
            self.tableView.backgroundView = viewNoData
            
        }
        return numOfSection
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 70
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataTableCell.count
    }
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:LichsunhanxuTableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! LichsunhanxuTableViewCell
        let dataCell = DataTableCell[indexPath.row]
        let pathString1 = "Bạn nhận được "
        let pathString2 = " xu từ "
        let noidung = "\(pathString1)\(dataCell.point)\(pathString2)\(dataCell.method) \(dataCell.noidung)."
        var noidungMutableString:NSMutableAttributedString = NSMutableAttributedString()
        noidungMutableString = NSMutableAttributedString(string: noidung, attributes: [NSFontAttributeName:UIFont.systemFontOfSize(12)])
        
        let location = pathString1.characters.count //+ pathString2.characters.count
        let length = "\(dataCell.point)".characters.count
        
        let color = UIColor(red:1.00, green:0.39, blue:0.27, alpha:1.0)
        noidungMutableString.addAttribute(NSForegroundColorAttributeName, value: color, range: NSRange(location: location,length:length))
        
        let location2 = noidung.characters.count - "\(dataCell.noidung)".characters.count - 1
        let length2 = "\(dataCell.noidung)".characters.count
        noidungMutableString.addAttribute(NSForegroundColorAttributeName, value: color, range: NSRange(location: location2,length:length2))
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        cell.content.attributedText = noidungMutableString
        cell.created_at.text = dataCell.created_at
        return cell
    }

    func getDataTable() {
        if let Nhanxu:NSArray = GetDataModel(Url: LinkServe().UrlLichsunhanxu + UserModel().Token()).ValuesData{
            DataTableCell.removeAll()
            if (Nhanxu.count > 0) {
                for i in 0...Nhanxu.count - 1 {
                    let data = Nhanxu[i]
                    DataTableCell.append(LichsunhanxuModel(noidung: data["noidung"] as! String, point: (data["point"] as! NSString).integerValue, method: data["method"] as! String, created_at: data["created_at"] as! String))
                }
            }
        }
        
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
