//
//  HistoryRedeemViewController.swift
//  Thẻ Chùa
//
//  Created by Hoang Dao on 5/6/16.
//  Copyright © 2016 Hoang Dao. All rights reserved.
//

import UIKit

class HistoryRedeemViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {


    @IBOutlet weak var tableView: UITableView!
    
    var DataTableCellLichSuDoiQua = Array<LichsudoiquaModel>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
        let nib:UINib = UINib(nibName: "HistoryRedeemTableViewCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "cell")
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            dispatch_async(dispatch_get_main_queue(), {
                Loading().showLoading()
            })
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
            self.getDataTableView()
            dispatch_async(dispatch_get_main_queue(), {
                self.tableView.reloadData()
                Loading().hideLoading()
            })
        })
    }
    
    func getDataTableView(){
        
        let url:String = LinkServe().UrlLichsudoiqua + UserModel().Token()
        if let Doiqua:NSArray = GetDataModel(Url: url).ValuesData {
            DataTableCellLichSuDoiQua.removeAll()
            if (Doiqua.count > 0) {
                for i in 0...Doiqua.count-1 {
                    let maindata = Doiqua[i]
                    let menhgiaInt:Int = (maindata["menhgia"] as! NSString).integerValue
                    let menhgia:String = "\(menhgiaInt)"
                    DataTableCellLichSuDoiQua.append(LichsudoiquaModel(serial: maindata["serial"] as! String, imei: maindata["imei"] as! String, menhgia: menhgia, method: maindata["method"] as! String, created_at: maindata["created_at"] as! String))
                }
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataTableCellLichSuDoiQua.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        var numOfSection: NSInteger = 0
        
        if DataTableCellLichSuDoiQua.count > 0 {
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
        return 80
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:HistoryRedeemTableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! HistoryRedeemTableViewCell
        if DataTableCellLichSuDoiQua.count > 0 {
            let dataTable = DataTableCellLichSuDoiQua[indexPath.row]
            cell.mathe.text = "Mã thẻ: " + dataTable.imei
            cell.seri.text = "Seri: " + dataTable.serial
            cell.menhgia.text = dataTable.menhgia + " VNĐ"
            cell.created_at.text = dataTable.created_at
            switch (dataTable.method) {
            case "Viettel":
                cell.imageMethod.image = UIImage(named: "Viettel-Image")
            case "Mobifone":
                cell.imageMethod.image = UIImage(named: "Mobile-Image")
            case "Vinaphone":
                cell.imageMethod.image = UIImage(named: "Vina-Image")
            default:
                cell.imageMethod.image = UIImage(named: "iconapps")
            }
        }
        
        return cell
    }
    
}
