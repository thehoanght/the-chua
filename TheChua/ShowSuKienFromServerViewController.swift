//
//  ShowSuKienFromServerViewController.swift
//  Thẻ Chùa
//
//  Created by Hoang Dao on 5/31/16.
//  Copyright © 2016 Hoang Dao. All rights reserved.
//

import UIKit

class ShowSuKienFromServerViewController: UIViewController {

    
    
    @IBOutlet weak var ImageSukien: UIImageView!
    
    @IBOutlet weak var TenSukien: UILabel!
    
    @IBOutlet weak var Noidung: UITextView!
    
    var SukienData:EventsModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ImageSukien.image = SukienData?.image
        ImageSukien.layer.cornerRadius = ImageSukien.frame.size.height/2
        ImageSukien.layer.masksToBounds = true
        TenSukien.text = SukienData?.tenEvents
        Noidung.text = SukienData?.noidung
        
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
